require "httparty"
require "pry"
url = "https://api.yelp.com/v3/businesses/search?term=burgers&location=boston"
response = HTTParty.get(url, headers: {"Authorization": "Bearer EMUVpBgXKj60gl21EX2crK5_aHxWIpxjvkdTyarqEqkrHW8g63OdUCwg4pjVYq7QBMsxclet8X_OXuPDJBZtBP_IanEUyQ8l0gKSuQLmsdJLKjYkCLUPAmulzDVUWXYx"})
response["businesses"].each do |b|
  Restaurant.create(
    name: b["name"],
    address: b["location"]["address1"],
    city: "Boston",
    state: "MA",
    zip_code: b["location"]["zip_code"],
    description: "N/A"
  )
end
