class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description
end
