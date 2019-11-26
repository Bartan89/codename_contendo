class TranslationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def create?
      true
    end

    def edit?
      true
    end

    def update?
      true
    end

    def show?
      true
    end

    def destroy?
      record.user == user
    end

    def publish?
      record.user == user
    end

    def unpublish?
      record.user == user
    end




end
