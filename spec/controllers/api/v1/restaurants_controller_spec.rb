require "rails_helper"
require 'pry'

RSpec.describe Api::V1::RestaurantsController, type: :controller do

  let!(:restaurant_one) { Restaurant.create(
    name: "name",
    address: "address",
    city: "city",
    state: "state",
    zip_code: "zip code",
    description: "description"
    )
  }
  let!(:restaurant_two) { Restaurant.create(
    name: "name two",
    address: "address two",
    city: "city two",
    state: "state two",
    zip_code: "zip code two",
    description: "description two"
    )
  }



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
      expect(body["restaurants"].first["description"]).to eq("description")
      expect(body["restaurants"].first["address"]).to eq("address")
      expect(body["restaurants"].first["city"]).to eq("city")
      expect(body["restaurants"].first["state"]).to eq("state")
      expect(body["restaurants"].first["zip_code"]).to eq("zip code")

      expect(body["restaurants"].last["name"]).to eq("name two")
      expect(body["restaurants"].last["description"]).to eq("description two")
      expect(body["restaurants"].last["address"]).to eq("address two")
      expect(body["restaurants"].last["city"]).to eq("city two")
      expect(body["restaurants"].last["state"]).to eq("state two")
      expect(body["restaurants"].last["zip_code"]).to eq("zip code two")

    end



    describe "GET#show" do

      it "should return a restaurant and all its reviews" do
        get :show, params: { id: restaurant_one.id }
        body = JSON.parse(response.body)

        expect(response.status).to eq 200
        expect(response.content_type).to eq("application/json")

        binding.pry

      end

    end

  end



end
