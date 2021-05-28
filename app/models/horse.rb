class Horse < ApplicationRecord
  has_many :bets
  has_many :runnings
  has_one_attached :photo
end
