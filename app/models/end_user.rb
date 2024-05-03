class EndUser < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :post_plamos, dependent: :destroy
  has_many :post_reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :usefuls, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  # def get_profile_image
  #   unless profile_image.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image2.jpeg')
  #     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   profile_image
  # end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |end_user|
      end_user.password = SecureRandom.urlsafe_base64
      end_user.name = "ゲスト"
    end
  end
end
