require "open-uri"

Participation.destroy_all
puts " participation destroy"

Running.destroy_all
puts " bet destroy"

Bet.destroy_all
puts" bets destroy"

Race.destroy_all
puts "race destriy"

Room.destroy_all
puts " Room destroy"

User.destroy_all
puts " user destroy "

Horse.destroy_all
puts "horse destroy"



puts 'Create user'
  u1 = User.create!(email: 'had@gmail.com', password: '123456', username: "had")
  u2 = User.create!(email: 'nico@gmail.com', password: '123456', username: "nico")
  u3 = User.create!(email: 'kev@gmail.com', password: '123456', username: "kev")
  u4 = User.create!(email: 'test@gmail.com', password: '123456', username: "test")
  u5 = User.create!(email: 'antoine@gmail.com', password: '123456', username: "lmd")
puts 'Done'

puts 'Create horses'
  file = URI.open('https://res.cloudinary.com/dekexda28/image/upload/v1621950902/jockey4_msryzp.png')
  h1 = Horse.new(name: 'tempete', rating: 1, description: "vigoureux, courageux et majestueux sont les adjectifs contraires de ce cheval.")
  h1.photo.attach(io: file, filename: 'h1.png', content_type: 'image/png')

  file = URI.open('https://res.cloudinary.com/dekexda28/image/upload/v1621950902/jockey2_oup5nj.png')
  h2 = Horse.create!(name: 'chaisepliante', rating: 2, description: "Ce cheval est complètement ravagé, si votre soif ne s'arrête jamais choisissez le.")
  h2.photo.attach(io: file, filename: 'h2.png', content_type: 'image/png')

  file = URI.open('https://res.cloudinary.com/dekexda28/image/upload/v1621950902/jockey3_ehjcit.png')
  h3 = Horse.create!(name: 'elcanason', rating: 3, description:"Le cheval par excellence, gracieux et doué, il vous aidera à rester sobre.")
  h3.photo.attach(io: file, filename: 'h3.png', content_type: 'image/png')

  file = URI.open('https://res.cloudinary.com/dekexda28/image/upload/v1621950902/jockey1_uvghjx.png')
  h4 = Horse.create!(name: 'saucissonblanc', rating: 4, description:"Un cheval avec un pas lourd mais peu souvent surprendre ses adversaires avec ses attrtibuts." )
  h4.photo.attach(io: file, filename: 'h4.png', content_type: 'image/png')

  file = URI.open('https://res.cloudinary.com/dekexda28/image/upload/v1621950902/jockey5_gfmvlp.png')
  h5 = Horse.create!(name: 'tonnerre', rating: 5, description:"Avec ce nouveau cheval tout droit venu d'Islande courrez à fond dans l'hippodrome.")
  h5.photo.attach(io: file, filename: 'h5.png', content_type: 'image/png')

puts 'Done'

puts 'Create room'
  r1 = Room.create!(user: u1, code:'1234')
  r2 = Room.create!(user: u4, code: '5678')
puts 'Done'

puts 'Create races'
  race1 = Race.create!(room: r1)
  race2 = Race.create!(room: r2)
puts 'Done'

puts 'Create bet'
  Bet.create!(horse: h1, user: u1, race: race1, sip: 3)
  Bet.create!(horse: h2, user: u2, race: race1, sip: 5)
  Bet.create!(horse: h3, user: u3, race: race1, sip: 4)
  Bet.create!(horse: h4, user: u4, race: race2, sip: 4)
  Bet.create!(horse: h5, user: u5, race: race1, sip: 4)
puts 'Done'

puts 'Create runnings'
  Running.create!(horse: h1, race: race1, position: 5, speed: 3, acceleration: 2)
  Running.create!(horse: h2, race: race1, position: 4, speed: 3, acceleration: 2)
  Running.create!(horse: h3, race: race1, position: 3, speed: 3, acceleration: 2)
  Running.create!(horse: h4, race: race1, position: 2, speed: 3, acceleration: 2)
  Running.create!(horse: h5, race: race1, position: 1, speed: 2, acceleration: 1)
puts 'Done'

puts 'Create participation'
  participation1 = Participation.create!(user: u1, room: r1)
  participation2 = Participation.create!(user: u2, room: r1)
  participation3 = Participation.create!(user: u3, room: r1)
  participation4 = Participation.create!(user: u5, room: r1)
puts 'Done'
