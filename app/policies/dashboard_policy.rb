class DashboardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user
  end

  def update?
    scope.where(user: user)
  end

      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
