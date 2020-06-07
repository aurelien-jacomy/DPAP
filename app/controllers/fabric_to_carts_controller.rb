class FabricToCartsController < ApplicationController
	before_action :set_fabric_to_cart, only: [:destroy, :update]

	def show_user_cart
		cart = policy_scope(FabricToCart).order(:created_at)
		@cart = FabricToCart.cart_by_supplier(cart)
	end

	def create
		@fabric = Fabric.find(params[:fabric_to_cart][:fabric_id])
		@fabric_to_cart = FabricToCart.new(cart_params)
		authorize @fabric_to_cart
		@fabric_to_cart.user = current_user
        @fabric_to_cart.fabric = @fabric

    current_user.update(checkout_session_id: nil)

		if @fabric_to_cart.save && params[:commit] == "COMPRAR AGORA"
			redirect_to cart_path
		else
			sleep 3
			redirect_to fabrics_path
		end
	end
	
	def destroy
		authorize @cart
		@cart.destroy
		redirect_to cart_path
	end

	def destroy_all
		cart = policy_scope(FabricToCart)
		cart.each do |item|
			authorize item
			item.destroy
		end
		redirect_to cart_path
	end

	def update
		authorize @cart
		if @cart.update(cart_params)
			current_user.update(checkout_session_id: nil)
			redirect_to cart_path
		else
			render :show_user_cart
		end
	end

	def set_delivery_point
		f_carts = FabricToCart.where(user: current_user)
		
		unless params[:delivery_point][:id] == ""

			delivery_point = DeliveryPoint.find(params[:delivery_point][:id])
			
			f_carts.each do |f_cart|
				authorize f_cart
				f_cart.update(delivery_point: delivery_point)
			end

			redirect_to new_payment_path
		else
			@error_message = "Selecione um endereço"
			@delivery_point = DeliveryPoint.new
			@delivery_points = policy_scope(DeliveryPoint).order('created_at DESC')
			render "delivery_points/index"
		end
	end

	private

	def cart_params
		params.require(:fabric_to_cart).permit(:quantity)
	end

	def set_fabric_to_cart
		@cart = FabricToCart.find(params[:id])
	end

end
