class Race < ApplicationRecord
  has_many :bets
  has_one :rooms
  has_many :running
end
