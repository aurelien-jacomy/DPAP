class DeliveryPointPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
  	true
  end

  def destroy?
  	record.user == user
  end

  def as_favourite?
  	record.user == user
  end
end
