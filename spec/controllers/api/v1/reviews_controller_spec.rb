require "rails_helper"
require 'pry'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  let!(:restaurant_one) { Restaurant.create(
    name: "name",
    address: "address",
    city: "city",
    state: "state",
    zip_code: "zip code",
    description: "description"
    )
  }

    let!(:user) { User.create(
      username: "Bobert Jr.",
      email: "ReturnofBobert@limewire.com",
      password: "password123"
      )

    }

  let!(:review) { Review.create(
    user: user,
    restaurant: restaurant_one,
    rating: 5,
    body: "Very good"
    )

  }

  describe "POST#delete" do
    it "should delete a review" do
      delete :destroy, id: review["id"]
      returned_json = JSON.parse(response.body)
      expect(returned_json).to be_kind_of(Hash)
    end
  end
end
