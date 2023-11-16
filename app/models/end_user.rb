class EndUser < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_plamos
  has_many :post_reviews
end
