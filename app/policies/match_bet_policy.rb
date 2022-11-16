class MatchBetPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def edit?
    create?
  end

  def update?
    create?
  end

  def create?
    record.participant.user.id == user.id
  end
end
