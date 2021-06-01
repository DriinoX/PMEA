class Room < ApplicationRecord
  belongs_to :user
  has_many :participations
  has_many :users, through: :participations
  has_many :races


  def refresh?
    self.races.last&.started?
  end
end
