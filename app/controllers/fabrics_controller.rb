class FabricsController < ApplicationController
	before_action :set_fabric, only: [ :show ]

    def index
        @fabrics = policy_scope(Fabric) 
    end

    def show
        @fabric_to_cart = FabricToCart.new
        @fabric_to_cart.user = current_user
        @fabric_to_cart.fabric = @fabric
        @fabric_to_cart.quantity = @fabric.minimum_qty
    end

    private

    def set_fabric
    	@fabric = Fabric.find(params[:id])
    	authorize @fabric
    end
end
