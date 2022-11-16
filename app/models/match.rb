class Match < ApplicationRecord
  belongs_to :tournament
  belongs_to :away_competitor, class_name: "Competitor"
  belongs_to :home_competitor, class_name: "Competitor"
end
