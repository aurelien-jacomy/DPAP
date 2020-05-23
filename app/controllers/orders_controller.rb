class OrdersController < ApplicationController
	def show
		@cart = current_user.cart_by_supplier
		authorize @cart
	end
end
