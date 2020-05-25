class FabricToCartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(fabric: :company).where(user: user).order('companies.name')
    end
  end
end
