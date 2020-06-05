class OrdersController < ApplicationController
	def new		
		cart_array = policy_scope(FabricToCart).order('fabrics.name')
		cart = FabricToCart.cart_by_supplier(cart_array)

		delivery_point = cart.values.flatten.first.delivery_point
		delivery_address = delivery_point.to_s

		temp_order = Order.new
		authorize temp_order
		
		cart.each_key do |supplier|
			order = Order.create(
				user: current_user,
				userid: current_user.id,
				delivery_point: delivery_point,
				delivery_address: delivery_address,
				checkout_session_id: current_user.checkout_session_id,
				status: "pending" 
				)

			cart[supplier].each do |f_to_c|
				fabric = f_to_c.fabric
				FabricToOrder.create(
					order: order,
					fabric: fabric,
					fabric_sku: fabric.id,
					price: fabric.price,
					quantity: f_to_c.quantity
					)
			end
		end

		current_user.update(checkout_session_id: nil)
		FabricToCart.destroy_all
		redirect_to orders_path
	end

	def index
		@orders = policy_scope(Order).order(created_at: :desc)
	end

end
