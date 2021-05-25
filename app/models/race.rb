class Race < ApplicationRecord
  belongs_to :room
  has_many :bets
  has_many :runnings
end
