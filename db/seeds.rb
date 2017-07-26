require 'httparty'
require 'dotenv/load'

User.create(
  admin: true,
  username: 'BurgrAdmin',
  email: 'burgrco@gmail.com',
  password: 'MakeNoBugs!',
)

url = "https://api.yelp.com/v3/businesses/search?term=burger&location=boston"
response = HTTParty.get(url, headers: { "Authorization" => "Bearer #{ENV['YELP_ACCESS_TOKEN']}" })
response["businesses"].each do |business|
  tags = []
  business["categories"].each do |category|
    tags << category["title"]
  end
  basic_description = tags.join(", ")
  Restaurant.create(
    name: business["name"],
    address: business["location"]["display_address"].first,
    city: business["location"]["city"],
    state: business["location"]["state"],
    zip_code: business["location"]["zip_code"],
    description: basic_description
    user_id: User.first.id
  )
  User.create(
    admin: true,
    username: 'BurgrAdmin',
    email: 'burgrco@gmail.com',
    password: 'MakeNoBugs!',
  )
end
