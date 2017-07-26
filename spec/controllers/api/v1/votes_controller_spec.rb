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
    description: "Lots of stuff!",
    user_id: user.id
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
      post_json = { review_id: Review.first.id, up_down: true}
      response = post(:create, post_json)
      returned_json = JSON.parse(response.body)
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["vote"]["up_down"]).to eq true
      expect(returned_json["vote"]["user_id"]).to eq(User.first.id)
      expect(returned_json["vote"]["review_id"]).to eq(Review.first.id)

    end

    it "updates a vote if the vote already exists" do
      sign_in User.find(user["id"])

      #cast initial vote
      post_json = { review_id: Review.first.id, up_down: true}
      response = post(:create, post_json)
      first_vote = JSON.parse(response.body)
      expect(first_vote).to be_kind_of(Hash)
      #expect it to be returned as an upvote
      expect(first_vote["vote"]["up_down"]).to eq true
      expect(first_vote["vote"]["user_id"]).to eq(User.first.id)
      expect(first_vote["vote"]["review_id"]).to eq(Review.first.id)

      #cast a second vote on the same review, this time as a downvote
      post_json = { review_id: Review.first.id, up_down: false}
      response = post(:create, post_json)
      second_vote = JSON.parse(response.body)
      #expect it to be the same vote_id as in the previous example,
      #but with different attributes
      expect(second_vote["vote"]["id"]).to eq(first_vote["vote"]["id"])
      expect(second_vote).to be_kind_of(Hash)
      expect(second_vote["vote"]["up_down"]).to eq false
      expect(second_vote["vote"]["user_id"]).to eq(User.first.id)
      expect(second_vote["vote"]["review_id"]).to eq(Review.first.id)

      #cast a third vote on the same review, this time as an upvote
      post_json = { review_id: Review.first.id, up_down: true}
      response = post(:create, post_json)
      third_vote = JSON.parse(response.body)
      #expect it to be the same vote_id as in the previous example,
      #but with different attributes
      expect(third_vote["vote"]["id"]).to eq(first_vote["vote"]["id"])
      expect(third_vote["vote"]["id"]).to eq(second_vote["vote"]["id"])
      expect(third_vote).to be_kind_of(Hash)
      expect(third_vote["vote"]["up_down"]).to eq true
      expect(third_vote["vote"]["user_id"]).to eq(User.first.id)
      expect(third_vote["vote"]["review_id"]).to eq(Review.first.id)

      #cast a fourth vote on the same review, this time as an upvote
      post_json = { review_id: Review.first.id, up_down: false}
      response = post(:create, post_json)
      fourth_vote = JSON.parse(response.body)
      #expect it to be the same vote_id as in the previous example,
      #but with different attributes
      expect(fourth_vote["vote"]["id"]).to eq(first_vote["vote"]["id"])
      expect(fourth_vote["vote"]["id"]).to eq(second_vote["vote"]["id"])
      expect(fourth_vote["vote"]["id"]).to eq(third_vote["vote"]["id"])
      expect(fourth_vote).to be_kind_of(Hash)
      expect(fourth_vote["vote"]["up_down"]).to eq false
      expect(fourth_vote["vote"]["user_id"]).to eq(User.first.id)
      expect(fourth_vote["vote"]["review_id"]).to eq(Review.first.id)
    end
  end
end
