class FabricToCartsController < ApplicationController
	before_action :set_fabric_to_cart, only: [:destroy, :update]

	def show_user_cart
		cart = policy_scope(FabricToCart)
		@cart = cart_by_supplier(cart)
		@delivery_point = DeliveryPoint.new
		@delivery_points = DeliveryPoint.where(user: current_user).order('created_at DESC')
	end

	def create
		@fabric = Fabric.find(params[:fabric_to_cart][:fabric_id])
		@fabric_to_cart = FabricToCart.new(cart_params)
		authorize @fabric_to_cart
		@fabric_to_cart.user = current_user
        @fabric_to_cart.fabric = @fabric

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

	def update
		authorize @cart
		if @cart.update(cart_params)
			redirect_to cart_path
		else
			render :show_user_cart
		end
	end

	def set_delivery_point
		f_carts = FabricToCart.where(user: current_user)
		delivery_point = DeliveryPoint.find(params[:delivery_point][:id])
		
		f_carts.each do |f_cart|
			authorize f_cart
			f_cart.update(delivery_point: delivery_point)
		end

		redirect_to cart_path	
	end

	private

	def cart_params
		params.require(:fabric_to_cart).permit(:quantity)
	end

	def set_fabric_to_cart
		@cart = FabricToCart.find(params[:id])
	end

	def cart_by_supplier(cart)
  	cart_by_supplier = {}
  	cart.each do |order_item|
  		if cart_by_supplier[order_item.company].nil?
  			cart_by_supplier[order_item.company] = [order_item]
  		else
  			cart_by_supplier[order_item.company] << order_item
  		end
  	end
  	return cart_by_supplier
  end
end
