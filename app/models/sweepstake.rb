class Sweepstake < ApplicationRecord
  belongs_to :user
  belongs_to :tournament
  has_many :participants

  validates :name, :starting_at, :ending_at, :tournament, presence: true
  validate :ending_at_cannot_be_in_the_past,
    :starting_at_cannot_be_greater_than_ending_at

  def ending_at_cannot_be_in_the_past
    if ending_at.present? && ending_at < Date.today
      errors.add(:ending_at, "can't be in the past")
    end
  end

  def starting_at_cannot_be_greater_than_ending_at
    if starting_at > ending_at
      errors.add(:starting_at, "can't be greater than ending_at")
    end
  end
end
