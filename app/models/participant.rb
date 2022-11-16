class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :sweepstake
  belongs_to :competitor
  has_many :match_bets

  validates :paid, :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }

  def match_bet(match)
    match_bets.find_by(match: match) || MatchBet.new
  end
end
