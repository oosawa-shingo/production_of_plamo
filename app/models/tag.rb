class Tag < ApplicationRecord

  has_many :tag_tables, dependent: :destroy
  has_many :post_plamos, through: :tag_tables

  validates :tag_name, presence: true

end
