class FabricsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :show, :index ]
	before_action :set_fabric, only: [ :show, :edit, :update, :destroy ]

    def index
        @fabric_colors = Fabric.select(:colour).distinct.map {|x| x.colour}
        @fabric_types = Fabric.select(:fabric_type).distinct.map {|x| x.fabric_type}
        @fabric_labels = Label.select(:name).distinct.map {|x| x.name}
        
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

    def new
        @company = current_user.what_company
        authorize @company
        @fabric = Fabric.new  
    end

    def create
        @company = current_user.what_company
        authorize @company
        @fabric = Fabric.new(fabric_params)
        @fabric.company = @company
        
        params[:fabric][:label_ids].each do |label_id|
            label = Label.find(label_id)
            LabelToFabric.create(
                label: label,
                fabric: @fabric
            )    
        end

        if @fabric.save
            redirect_to @fabric
        else
            render :new
        end
    end

    def edit
        @company = current_user.what_company
    end

    def update
        if @fabric.update(fabric_params)
            redirect_to @fabric
        else
            render :edit
        end
    end

    def destroy
        company = @fabric.company
        @fabric.destroy
        redirect_to fabrics_company_path(company)
    end

    private

    def set_fabric
    	@fabric = Fabric.find(params[:id])
    	authorize @fabric
    end

    def fabric_params
        params.require(:fabric).permit(
            :name,
            :colour,
            :width,
            :gramatura,
            :fabric_type,
            :composition,
            :price,
            :shipment_time,
            :minimum_qty,
            label_ids: [],
            photos: []
            )
    end
end
