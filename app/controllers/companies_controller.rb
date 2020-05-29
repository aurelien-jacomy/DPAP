class CompaniesController < ApplicationController

    def new
        @company = Company.new
        authorize @company
    end

    def create
        @company = Company.new(company_params) 
        authorize @company
        @company.owner = current_user
        
        if @company.save
            redirect_to root_path
        else
            render :new
        end
    end

    def show
        @company = policy_scope(Company).find_by(owner: current_user)
        authorize @company     
    end

    private

    def company_params
        params.require(:company).permit(:name, :billing_address, :cep, :description)
    end
        
end
