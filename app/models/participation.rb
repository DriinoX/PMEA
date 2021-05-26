class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  # validates :user, uniqueness: { scope: :room,
  #   message: "Utilisateur déja dans la room" }
end
