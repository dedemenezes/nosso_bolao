class Team < ApplicationRecord
  has_many :participants, class_name: 'Bet'
end
