# frozen_string_literal: true
class User < ActiveRecord::Base

  extend Devise::Models #added this line to extend devise model
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User
  has_many :produits, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_products, through: :favorites, source: :produit, dependent: :destroy
  validates :telephone, presence: true, uniqueness: true, format: {with: /\d{2} \d{3} \d{2} \d{2}/}
  validates :name, presence: true, length: {minimum: 3, maximum: 25}, case_sensitive: false
  validates :email, email: true
   # format: { with: /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/, message: "Email invalid"  },
   #           uniqueness: { case_sensitive: false },
   #           length: { minimum: 4, maximum: 254 }
   #             validates :password, presence: true


  end
