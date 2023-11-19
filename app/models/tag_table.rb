class TagTable < ApplicationRecord

  belongs_to :post_plamo

  belongs_to :tag

  validates :post_plamo_id, presence: true
  validates :tag_id, presence: true
end
