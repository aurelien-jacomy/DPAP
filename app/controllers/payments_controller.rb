class PaymentsController < ApplicationController
	def new
		cart = policy_scope(FabricToCart)
		line_items = []
		
		cart.each do |ftc| 
			line_items <<	{
	      name: ftc.fabric.name,
	      amount: ftc.fabric.price,
	      currency: 'brl',
	      quantity: ftc.quantity
	    }
	  end

	  payment = Payment.new
	  authorize payment

		session = Stripe::Checkout::Session.create(
	    payment_method_types: ['card'],
	    line_items: line_items,
	    success_url: empty_cart_payments_url,
	    cancel_url: cart_url
	  )

	  current_user.update(checkout_session_id: session.id)

	  redirect_to new_order_path
	end

	def empty_cart
		current_user.update(checkout_session_id: nil)
		cart = policy_scope(FabricToCart)
		cart.map { |f_to_c| f_to_c.destroy }
		redirect_to orders_path
	end
end
