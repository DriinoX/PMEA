class Room < ApplicationRecord
  belongs_to :race
  has_many :invitaions
end
