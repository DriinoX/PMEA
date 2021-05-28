class Running < ApplicationRecord
  belongs_to :horse
  belongs_to :race

  def self.cote
    [3, 3.5, 2.5, 4, 4.5, 5, 6, 7, 10].shuffle.sample
  end
end
