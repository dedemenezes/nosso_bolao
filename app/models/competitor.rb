class Competitor < ApplicationRecord
  belongs_to :tournament
  has_many :participants
  has_many :matches_as_away_competitor, class_name: "Match", foreign_key: :away_competitor_id
  has_many :matches_as_home_competitor, class_name: "Match", foreign_key: :home_competitor_id
end
