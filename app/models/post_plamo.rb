class PostPlamo < ApplicationRecord

  has_one_attached :image
  belongs_to :end_user

  has_many :tag_tables, dependent: :destroy
  has_many :tags, through: :tag_tables
  has_many :favorites, dependent: :destroy
  has_many :usefuls, dependent: :destroy

  validates :title, presence: true
  validates :introduction, presence: true
  validates :image, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def self.search(keyword)
    where("title LIKE ? or introduction LIKE ?",  "%#{keyword}%", "%#{keyword}%")
  end

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end

  def usefuled_by?(end_user)
    usefuls.exists?(end_user_id: end_user.id)
  end
end
