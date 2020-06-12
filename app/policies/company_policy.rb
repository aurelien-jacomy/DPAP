class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def search?
    true
  end

  def fabrics?
    if user.what_company == record
      if record.owner == user
        true
      else
        user.company_user.status == "active"
      end
    else
      false
    end
  end

end
