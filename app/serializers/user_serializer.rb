class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :telephone
  has_many :favorite_products
end
