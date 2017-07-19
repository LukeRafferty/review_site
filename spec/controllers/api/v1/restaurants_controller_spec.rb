require "rails_helper"

RSpec.describe Api::V1::RestaurantsController, type: :controller do

  let!(:restaurant) { Restaurant.create(name: "name", location: "location", description: "description") }
  let!(:restaurant_two) { Restaurant.create(name: "name_two", location: "location_two", description: "description_two") }

  describe "GET#index" do
    it "should return the correct object" do

      get :index
      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")


      expect(body.length).to eq 1
      expect(body["restaurants"].length).to eq 2
      expect(body["restaurants"]).to be_kind_of(Array)
      expect(body["restaurants"]).to_not be_kind_of(Hash)

      expect(body["restaurants"].first["name"]).to eq("name")
      expect(body["restaurants"].first["location"]).to eq("location")
      expect(body["restaurants"].first["description"]).to eq("description")

      expect(body["restaurants"].last["name"]).to eq("name_two")
      expect(body["restaurants"].last["location"]).to eq("location_two")
      expect(body["restaurants"].last["description"]).to eq("description_two")
    end
  end



end
