require "rails_helper"

RSpec.describe Api::V1::ReviewsController, type: :controller do


    let!(:bobert) { User.create(
      username: "Bobert",
      email: "ReturnofBobert@limewire.com",
      password: "bobertpassword"
    )}
    let!(:credence) { User.create(
      username: "Credence",
      email: "credence@limewire.com",
      password: "credencepassword"
    )}
    let!(:admin) { FactoryGirl.create(:user, admin: true) }
    let!(:restaurant) { FactoryGirl.create(:restaurant) }
    let!(:review) { Review.create(
      body: "Bobert was here",
      rating: "5",
      restaurant_id: restaurant["id"],
      user_id: bobert["id"]
    )}


  describe "review#delete" do
    it "deletes a review if the review id matches the user id" do
      sign_in bobert
      response = (delete :destroy, id: review.id)
      body = JSON.parse(response.body)
      expect(body).to be_kind_of(Hash)
      expect(body["result"]).to eq "Review will be deleted"
      expect(body["result"]).to_not eq "Failed to delete review"
      expect(body["result"]).to_not eq "You do not have permission to delete this review"
      expect(Review.all.length).to eq 0
    end
    it "deletes a review if the user is an admin" do
      sign_in admin
      response = (delete :destroy, id: review.id)
      body = JSON.parse(response.body)
      expect(body).to be_kind_of(Hash)
      expect(body["result"]).to eq "Review will be deleted"
      expect(body["result"]).to_not eq "Failed to delete review"
      expect(body["result"]).to_not eq "You do not have permission to delete this review"
      expect(Review.all.length).to eq 0
    end
    it "does not delete a review if the user does not have permission" do
      sign_in credence
      response = (delete :destroy, id: review.id)
      body = JSON.parse(response.body)
      expect(body).to be_kind_of(Hash)
      expect(body["result"]).to_not eq "Review will be deleted"
      expect(body["result"]).to_not eq "Failed to delete review"
      expect(body["result"]).to eq "You do not have permission to delete this review"
      expect(Review.all.length).to eq 1
    end
  end
end
