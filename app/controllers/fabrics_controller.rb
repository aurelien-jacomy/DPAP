class FabricsController < ApplicationController

    def index

        if params[:search][:query].present? && !params[:search][:query].nil?
            @query = params[:search][:query]
            @fabrics = policy_scope(Fabric.search_by_name_colour_width_gramatura_composition_and_fabric_type("#{@query}")) 
        else
            @fabrics = policy_scope(Fabric)
        end
    end
end
