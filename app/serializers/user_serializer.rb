class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :telephone, :admin, :confirmed?
  has_many :favorite_products
end
