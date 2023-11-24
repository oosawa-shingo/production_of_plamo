class Favorite < ApplicationRecord

  belongs_to :end_user
  belongs_to :post_plamo

  validates :end_user_id, uniqueness: {scope: :post_plamo_id}

end
