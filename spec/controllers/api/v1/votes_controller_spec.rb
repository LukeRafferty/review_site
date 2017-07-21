require "rails_helper"

RSpec.describe Api::V1::VotesController, type: :controller do

  let!(:user) { User.create(
    username: "Bobert Jr.",
    email: "ReturnofBobert@limewire.com",
    password: "password123"
    )
  }

  let!(:restaurant) { Restaurant.create(
    name: "Burger King",
    address: "78 Summer St",
    city: "Boston",
    state: "MA",
    zip_code: "02111",
    description: "Lots of stuff!"
    )}

  let!(:review) { Review.create(
    body: "Hello i'm burgers",
    rating: "5",
    user_id: user["id"],
    restaurant_id: restaurant["id"]
    )
  }

  describe 'POST #create' do
    it "creates a new vote" do
      sign_in User.find(user["id"])
      post_json = { review_id: review["id"], up_down: true}
      response = post(:create, post_json)
      returned_json = JSON.parse(response.body)
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["vote"]["up_down"]).to eq true
      expect(returned_json["vote"]["user_id"]).to eq(user["id"])
      expect(returned_json["vote"]["review_id"]).to eq(review["id"])

    end
  end
end
