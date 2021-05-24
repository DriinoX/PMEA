class Bet < ApplicationRecord
  belongs_to :horse
  belongs_to :user
  belongs_to :race
end
