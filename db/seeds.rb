# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
def fetch_api(url)
  response = URI.open(url,
    "Authorization" => "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzczZmRkOWZkOWFhYzIyNjcxNjI3MGUiLCJpYXQiOjE2Njg1NjA0NjIsImV4cCI6MTY2ODY0Njg2Mn0.KtyQggiAL1s3VxeMxrIsj1ZT_XjnUUcZffOHuXHB8_s"
  )
  JSON.parse(response.read)
end


def create_competitors(countries)
  wc = Tournament.last
  countries.each do |country|
    Competitor.create! name: country['name_en'], img_url: country['flag'], tournament: wc, group: country['groups']
  end
  puts "Competitors created: #{Competitor.count}"
end


puts 'Cleaning DB...'

MatchBet.destroy_all
Match.destroy_all
Participant.destroy_all
Competitor.destroy_all
Sweepstake.destroy_all
Tournament.destroy_all
Team.destroy_all
User.destroy_all

  # ====================================

puts 'Start seeds..'

# ====================================

puts "Users..."
User.create! nickname: 'Dede', email: 'dede@lw.com', password: 123456
User.create! nickname: 'Babi', email: 'babi@lw.com', password: 123456
puts "Users created: #{User.count}"

# ====================================

puts 'Tournaments...'
wc = Tournament.create! name: 'World Cup 2022'
puts wc.name + ' created!'

# ====================================

data = fetch_api 'http://api.cup2022.ir/api/v1/team'
create_competitors data["data"]

# ====================================

puts 'Sweepstakes..'
swst = Sweepstake.create(
  name: 'Nosso Bolao',
  starting_at: Date.today,
  ending_at: Date.today + 30,
  user: User.first,
  tournament: wc
)

puts swst.name + ' created!'

# ====================================

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

# ====================================

data = fetch_api('http://api.cup2022.ir/api/v1/match')
wc = Tournament.first
data['data'].each do |match|
  p match['local_date']
  time_data = match['local_date'].match /(0[0-9]|1[12])\/(1?[0-9]|[12][0-9]|3[01])\/(\d+)\s+(\d{2}:\d{2})/
  local_time = DateTime.new time_data[3].to_i, time_data[1].to_i, time_data[2].to_i, time_data[4].to_i
  home = Competitor.find_by_name(match['home_team_en'])
  away = Competitor.find_by_name(match['away_team_en'])
  Match.create!(
    away_score: match['away_score'],
    away_competitor: away,
    home_competitor: home,
    finished: match['finished'],
    group: match['group'],
    home_score: match['home_score'],
    local_date: local_time,
    matchday: match['matchday'],
    match_type: match['type'],
    tournament: wc
  )
  p Match.last
end
