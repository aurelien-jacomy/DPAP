class StripeCheckoutSessionService
  def call(event)
    orders = Order.where(checkout_session_id: event.data.object.id)
	  orders.map { |order| order.update(status: 'paid') }
  end
end
