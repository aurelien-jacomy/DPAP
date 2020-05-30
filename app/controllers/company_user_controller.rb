class CompanyUserController < ApplicationController

    # def new
    #     @company_user = CompanyUser.new
    # end

    def create 
        
        @company_user = CompanyUser.new(company_user_params)

        authorize @company_user
        @company_user.user = current_user
        
        if @company_user.save
            redirect_to root_path
        else
            render :new
        end

    end

    def update
        @company_user = CompanyUser.find(params[:id])
        
        authorize @company_user
        @company_user.update(company_user_params)
        @company_user.save ? (redirect_to root_path) : (redirect_to root_path)
        

    end

    private

      def company_user_params
          params.require(:company_user).permit(:id, :company_id, :user_id, :role, :status)
      end
end
