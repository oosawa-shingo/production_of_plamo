class Useful < ApplicationRecord

  belongs_to :end_user
  belongs_to :post_review

  validates :end_user_id, uniqueness: {scope: :post_review_id}
end
