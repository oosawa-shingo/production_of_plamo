class PostComment < ApplicationRecord

  belongs_to :end_user
  belongs_to :post_plamo

  validates :comment, presence: true
end
