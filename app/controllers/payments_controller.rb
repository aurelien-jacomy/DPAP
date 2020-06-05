class PaymentsController < ApplicationController
	def create
		cart = policy_scope(FabricToCart)
		line_items = []
		
		cart.each do |ftc| 
			line_items <<	{
	      name: ftc.fabric.id,
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
	    success_url: orders_url,
	    cancel_url: orders_url
	  )

	  current_user.update(checkout_session_id: session.id)

	  redirect_to delivery_points_path
	end
end
