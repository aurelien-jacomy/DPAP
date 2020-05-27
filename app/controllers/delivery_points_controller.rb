class DeliveryPointsController < ApplicationController

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
		delivery_point = DeliveryPoint.find(params[:id])
		authorize delivery_point
		delivery_point.destroy
		redirect_to cart_path
	end

	private

	def params_delivery_point
		params.require(:delivery_point).permit(:name, :address, :cep, :contact, :comment)
	end
end
