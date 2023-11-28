class PostPlamo < ApplicationRecord

  has_one_attached :plamo_image
  belongs_to :end_user

  has_many :tag_tables, dependent: :destroy
  has_many :tags, through: :tag_tables
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :title, presence: true
  validates :introduction, presence: true
  validates :plamo_image, presence: true

  def get_plamo_image
    unless plamo_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      plamo_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    plamo_image
  end

  def self.search(keyword)
    where("title LIKE ? or introduction LIKE ?",  "%#{keyword}%", "%#{keyword}%")
  end

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end

end
