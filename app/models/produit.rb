class Produit < ApplicationRecord
  belongs_to :user
  has_one_attached :image, :dependent => :destroy
  has_many :favorites
  has_many :likers , through: :favorites, source: :user, dependent: :destroy
end
