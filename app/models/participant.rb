class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :sweepstake
  belongs_to :team

  validates :paid, :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
