require 'open-uri'
require 'json'

def fetch_api
  response = URI.open('http://api.cup2022.ir/api/v1/team',
    "Authorization" => ENV['WORLD_CUP_API_KEY']
  )
  JSON.parse(response.read)
end

def create_teams(countries)
  countries.each do |country|
    Team.create! name: country['name_en'], img_url: country['flag']
  end
  puts "Teams created: #{Team.count}"
end

data = fetch_api
create_teams data["data"]
