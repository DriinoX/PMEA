puts 'Create user'
  u1 = User.create!(email: 'had@gmail.com', password: '123456')
  u2 = User.create!(email: 'nico@gmail.com', password: '123456')
puts 'Done'

puts 'Create horses'
  h1 = Horse.create!(name: 'tempete', rating: 1)
  h2 = Horse.create!(name: 'chaisepliante', rating: 2)
  h3 = Horse.create!(name: 'elcanason', rating: 3)
  Horse.create!(name: 'saucissonblanc', rating: 4)
  Horse.create!(name: 'tonnerre', rating: 5)
puts 'Done'

puts 'Create room'
  r1 = Room.create!(user: u1, code:'1234')
puts 'Done'

puts 'Create races'
  race1 = Race.create!(room: r1)
puts 'Done'

puts 'Create bet'
  Bet.create!(horse: h1, user: u1, race: race1, sip: 3)
  Bet.create!(horse: h2, user: u2, race: race1, sip: 5)
puts 'Done'

puts 'Create runnings'
  Running.create!(horse: h1, race: race1, position: 1, speed: 3, acceleration: 2)
  Running.create!(horse: h2, race: race1, position: 2, speed: 2, acceleration: 1)
puts 'Done'

puts 'Create participation'
  race1 = Participation.create!(user: u1, room: r1)
puts 'Done'
