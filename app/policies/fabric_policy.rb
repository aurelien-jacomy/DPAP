class FabricPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
  	return true
  end

  def new?
  	if user.what_company
  		user == user.what_company.owner
  	else
  		false
  	end
  end

  def create?
    new?
  end

  def edit?
    if user.what_company == record.company
      if record.company.owner == user
        true
      else
        user.company_user.status == "active"
      end
    else
      false
    end
  end

  def update?
    edit?
  end

  def destroy?
    user == record.company.owner
  end

end
