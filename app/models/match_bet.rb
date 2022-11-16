class MatchBet < ApplicationRecord
  belongs_to :match
  belongs_to :participant
  enum final_result: { pending: 0, correct: 1, wrong: 2 }
end
