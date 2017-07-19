class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :zip_code, :description
end
