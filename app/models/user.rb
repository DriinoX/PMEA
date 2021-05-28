class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bets
  has_many :participations
  has_many :rooms
  has_one_attached :photo

  def bet_for(race)
    self.bets.find_by(race: race)
  end
end
