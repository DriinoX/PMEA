class Horse < ApplicationRecord
  has_many :bets
  has_one :running
end
