class Race < ApplicationRecord
  belongs_to :room
  has_many :bets
  has_many :runnings
  has_many :horses, through: :runnings
end
