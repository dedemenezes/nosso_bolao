# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning DB...'
if Rails.env.development?
  Participant.destroy_all
  Competitor.destroy_all
  Sweepstake.destroy_all
  Tournament.destroy_all
  Team.destroy_all
  User.destroy_all
end

puts 'Start seeds..'

puts "Users..."
User.create! nickname: 'Dede', email: 'dede@lw.com', password: 123456
User.create! nickname: 'Babi', email: 'babi@lw.com', password: 123456
puts "Users created: #{User.count}"

puts 'Tournaments...'
wc = Tournament.create! name: 'World Cup 2022'
puts wc.name + ' created!'

Dir[File.join(Rails.root, 'db', 'base_seeds', '*.rb')].sort.each do |seed|
  load seed
end
Team.all.each do |team|
  Competitor.create! 
end

puts 'Sweepstakes..'
swst = Sweepstake.create(
  name: 'Nosso Bolao',
  starting_at: Date.today,
  ending_at: Date.today + 30,
  user: User.first,
  tournament: wc
)

puts swst.name + ' created!'

puts 'Participants...'

Participant.create!(
  user: User.first,
  sweepstake: swst,
  price: 5000,
  competitor: Competitor.all.sample,
  paid: true
)

Participant.create!(
  user: User.last,
  sweepstake: swst,
  price: 5000,
  competitor: Competitor.all.sample,
  paid: true
)

puts "Participant created: #{Participant.count}"
