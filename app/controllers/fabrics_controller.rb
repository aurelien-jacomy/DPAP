class FabricsController < ApplicationController
	before_action :set_fabric, only: [ :show ]

    def index
        @fabrics = policy_scope(Fabric) 
    end

    def show
    end

    private

    def set_fabric
    	@fabric = Fabric.find(params[:id])
    	authorize @fabric
    end
end
