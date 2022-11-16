class Team < ApplicationRecord
  QUALIFIED_TEAMS = [
    'Qatar',
    'Ecuador',
    'Senegal',
    'Nederlands',
    'England',
    'Iran',
    'United States',
    'Wales',
    'Argentina',
    'Saudi Arabia',
    'Mexico',
    'Poland',
    'France',
    'Australia',
    'Denmark',
    'Tunisia',
    'Spain',
    'Costa Rica',
    'Germany',
    'Japan',
    'Belgium',
    'Canada',
    'Morocco',
    'Croatia',
    'Brazil',
    'Serbia',
    'Switzerland',
    'Cameroon',
    'Portugal',
    'Ghana',
    'Uruguay',
    'South Korea'
  ]

  has_many :participants
  validates :name, inclusion: { in: QUALIFIED_TEAMS }
  validates :name, :img_url, presence: true
end
