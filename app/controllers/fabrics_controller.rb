class FabricsController < ApplicationController
	before_action :set_fabric, only: [ :show ]

    def index

    if params[:search].nil?
        @fabrics = policy_scope(Fabric)
         elsif params[:search][:query].blank?
            @fabrics = policy_scope(Fabric)
        else
            @query = params[:search][:query]
            @fabrics = policy_scope(Fabric.search_by_name_colour_width_gramatura_composition_and_fabric_type("#{@query}")) 
        end
    end

    def show
        @fabric_to_cart = FabricToCart.new
    end

    private

    def set_fabric
    	@fabric = Fabric.find(params[:id])
    	authorize @fabric
    end
end
