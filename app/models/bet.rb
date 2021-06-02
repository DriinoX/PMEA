class Bet < ApplicationRecord
  belongs_to :horse
  belongs_to :user
  belongs_to :race

   GORGE = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
   validates :sip, presence: true, inclusion: { in: GORGE,
     message: "Votre mise doit être inclue entre 1 et 10" }
end
