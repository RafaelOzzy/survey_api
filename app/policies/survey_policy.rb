class SurveyPolicy < ApplicationPolicy
  def create?
    user.coordinator?
  end

  def update?
    user.coordinator?
  end

  def destroy?
    user.coordinator?
  end

  class Scope < Scope
    def resolve
      if user.coordinator?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end
end

  # class Scope < ApplicationPolicy::Scope
  #   # NOTE: Be explicit about which records you allow access to!
  #   # def resolve
  #   #   scope.all
  #   # end
  # end
