class Race < ApplicationRecord
  belongs_to :room
  has_many :bets
  has_many :runnings
  has_many :horses, through: :runnings
  after_create :create_runnings
  enum progress: [:pending, :started, :closed]

  def create_runnings
    proba = []
    horses = Horse.all
    horses.all.each do |horse|
      horse.rating = Running.cote
      (horse.rating * 2).to_i.times do
        proba << horse
      end
    end
    horse_count = Horse.count
    horse_count.times do |i|
      horse = proba.sample
      Running.create(
        rating: horse.rating,
        race: self,
        position: (horse_count - i),
        horse: horse,
        speed: 1,
        acceleration: 2
        )
      proba.delete(horse)
    end

    # cinq = proba.sample
    # Running.create(race: self, position: 5, horse: Horse.find_by(name: cinq), speed: 1, acceleration: 2)
    # proba.delete(cinq)

    # quatre = proba.sample
    # Running.create(race: self, position: 4, horse: Horse.find_by(name: quatre), speed: 1, acceleration: 2)
    # proba.delete(quatre)

    # trois = proba.sample
    # Running.create(race: self, position: 3, horse: Horse.find_by(name: trois), speed: 1, acceleration: 2)
    # proba.delete(trois)

    # deux = proba.sample
    # Running.create(race: self, position: 2, horse: Horse.find_by(name: deux), speed: 1, acceleration: 2)
    # proba.delete(deux)

    # un = proba.sample
    # Running.create(race: self, position: 1, horse: Horse.find_by(name: un), speed: 1, acceleration: 2)
  end
end
