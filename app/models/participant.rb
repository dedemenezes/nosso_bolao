class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :sweepstake
  belongs_to :bet
end
