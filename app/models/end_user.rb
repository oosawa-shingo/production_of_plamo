class EndUser < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_plamos, dependent: :destroy
  has_many :post_reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

end
