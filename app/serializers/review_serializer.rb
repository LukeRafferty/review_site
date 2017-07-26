class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :rating, :votes
end
