class VoteSerializer < ActiveModel::Serializer
  attributes :id, :up_down, :user_id, :review_id
end
