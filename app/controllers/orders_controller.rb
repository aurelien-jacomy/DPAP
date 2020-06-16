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
				customer: current_user.what_company.name,
				supplier: supplier.name,
				userid: current_user.id,
				delivery_point: delivery_point,
				delivery_address: delivery_address,
				checkout_session_id: current_user.checkout_session_id,
				status: "pending" 
				)
 
			cart[supplier].each do |f_to_c|
				
				fabric = f_to_c.fabric
				if f_to_c.is_sample
					FabricToOrder.create(
						order: order,
						fabric: fabric,
						fabric_sku: fabric.id,
						price: fabric.sample_price,
						quantity: f_to_c.quantity
						)
				else
					FabricToOrder.create(
						order: order,
						fabric: fabric,
						fabric_sku: fabric.id,
						price: fabric.price,
						quantity: f_to_c.quantity
						)
				end
			end
		end
		
		redirect_to pending_orders_path
	end

	def index
		@orders = policy_scope(Order).order(created_at: :desc)
	end

	def pending
		@orders = policy_scope(Order).where(checkout_session_id: current_user.checkout_session_id)
	end
end
