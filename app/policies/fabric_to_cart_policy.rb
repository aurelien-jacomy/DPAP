class FabricToCartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(fabric: :company).where(user: user).order('companies.name')
    end
  end

  def destroy?
  	user == record.user
  end

  def update?
  	user == record.user
  end

  def create?
    true
  end

  def set_delivery_point?
    user == record.user
  end

  def destroy_all?
    destroy?
  end
end
