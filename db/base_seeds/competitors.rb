require 'open-uri'
require 'json'

def fetch_api(url)
  response = URI.open(url,
    "Authorization" => "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzczZmRkOWZkOWFhYzIyNjcxNjI3MGUiLCJpYXQiOjE2Njg1NjA0NjIsImV4cCI6MTY2ODY0Njg2Mn0.KtyQggiAL1s3VxeMxrIsj1ZT_XjnUUcZffOHuXHB8_s"
  )
  JSON.parse(response.read)
end


def create_teams(countries)
  wc = Tournament.last
  countries.each do |country|
    Competitor.create! name: country['name_en'], img_url: country['flag'], tournament: wc, group: country['groups']
  end
  puts "Teams created: #{Team.count}"
end

# data = fetch_api('http://api.cup2022.ir/api/v1/team')
# create_teams data["data"]

p fetch_api('http://api.cup2022.ir/api/v1/match')

# {"_id"=>"629c9c8a5749c4077500eb03",
# "away_score"=>0,
# "away_scorers"=>["null"],
# "away_team_id"=>"32",
# "finished"=>"FALSE",
# "group"=>"G",
# "home_score"=>0,
# "home_scorers"=>["null"],
# "home_team_id"=>"25",
# "id"=>"48",
# "local_date"=>"12/2/2022 22:00",
# "matchday"=>"13",
# "persian_date"=>"1400-09-11 22:30",
# "stadium_id"=>"1",
# "time_elapsed"=>"notstarted",
# "type"=>"group",
# "home_team_fa"=>"برزیل",
# "away_team_fa"=>"کامرون",
# "home_team_en"=>"Brazil",
# "away_team_en"=>"Cameroon",
# "home_flag"=>"https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/125px-Flag_of_Brazil.svg.png",
# "away_flag"=>"https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Flag_of_Cameroon.svg/125px-Flag_of_Cameroon.svg.png"}
