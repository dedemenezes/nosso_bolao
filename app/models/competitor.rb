class Competitor < ApplicationRecord
  belongs_to :tournament
  belongs_to :team
  has_many :participants
end
