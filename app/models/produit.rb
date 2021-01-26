class Produit < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :likers , through: :favorites, source: :user, dependent: :destroy
  validates :nom, presence: true
  validates :description, presence: true
  validates :prix, presence: true
end
