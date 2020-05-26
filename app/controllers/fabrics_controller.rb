class FabricsController < ApplicationController

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

end
