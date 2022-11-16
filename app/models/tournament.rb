class Tournament < ApplicationRecord
  has_many :sweepstakes
  has_many :competitors
end
