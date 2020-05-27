class DeliveryPointsController < ApplicationController
	before_action :set_delivery_point, only: [:destroy, :as_favourite]
	
	def create
		delivery_point = DeliveryPoint.new(params_delivery_point)
		delivery_point.user = current_user
		authorize delivery_point

		if delivery_point.save
			redirect_to cart_path
		else
			render "cart"
		end
	end

	def destroy
		authorize @delivery_point
		@delivery_point.destroy
		redirect_to cart_path
	end

	def as_favourite
		user_delivery_points = DeliveryPoint.where(user: current_user)
		user_delivery_points.each do |d_point|
			if d_point != @delivery_point && d_point.favourite?
				d_point.update(favourite: false)
			end
		end
		@delivery_point.update(favourite: true)
		redirect_to cart_path
	end

	private

	def params_delivery_point
		params.require(:delivery_point).permit(:name, :address, :cep, :contact, :comment)
	end

	def set_delivery_point
		@delivery_point = DeliveryPoint.find(params[:id])
		authorize @delivery_point
	end
end
