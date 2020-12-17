class Produit < ApplicationRecord
  belongs_to :user
  has_many_attached :image, :dependent => :destroy
end
