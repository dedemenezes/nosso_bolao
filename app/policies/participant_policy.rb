class ParticipantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    create?
  end

  def create?
    record.user_id == user.id && not_a_participant
  end

  def not_a_participant
    !record.sweepstake.participants.any? { |participant| participant.user.id == user.id }
  end
end
