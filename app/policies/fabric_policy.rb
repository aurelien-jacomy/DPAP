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

  end

end
