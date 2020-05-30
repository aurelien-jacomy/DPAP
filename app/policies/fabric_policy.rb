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
    user.what_company == record.company
  end

  def update?
    edit?
  end

  def destroy?
    user == record.company.owner
  end

end
