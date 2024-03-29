class PostPlamo < ApplicationRecord

  has_many_attached :plamo_images
  belongs_to :end_user

  has_many :tag_tables, dependent: :destroy
  has_many :tags, through: :tag_tables
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  FILE_NUMBER_LIMIT = 8

  validates :title, presence: true
  validates :introduction, presence: true
  validates :plamo_images, presence: true
  validates :tags, presence: true

  validate :validate_number_of_files

  def get_plamo_images
    unless plamo_images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      plamo_images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    plamo_images
  end

  def self.search(keyword)
    where("title LIKE ? or introduction LIKE ?",  "%#{keyword}%", "%#{keyword}%")
  end

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end

  private

  def validate_number_of_files
    return if plamo_images.length <= FILE_NUMBER_LIMIT
    errors.add(:plamo_images, "添付できる画像は#{FILE_NUMBER_LIMIT}枚までです。")
  end

end
