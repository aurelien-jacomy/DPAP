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
        @pending_users = CompanyUser.where(status: :pending).where("company_id = ?", @company.id) 
    end

    def search
        @companies = policy_scope(Company)
        authorize @companies
    
        if !params[:search].nil?
            @company = policy_scope(Company).find_by(cnpj: "#{params[:search][:query]}")
            if !@company.nil?
                authorize @company
            end
        end
    end

    def fabrics
        @company = Company.find(params[:id])
        authorize @company
        @fabrics = policy_scope(Fabric).where(company: @company)
    end

    private

    def company_params
        params.require(:company).permit(:name, :cep, :uf, :cidade, :bairro, :rua, :numero, :complemento, :cnpj, :description)
    end
        
end
