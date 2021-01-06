class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :favorite_products
end
