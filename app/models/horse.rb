class Horse < ApplicationRecord
  has_many :bets
  has_many :runnings
end
