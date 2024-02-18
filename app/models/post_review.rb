class PostReview < ApplicationRecord

   has_many_attached :review_images
   belongs_to :end_user

   has_many :usefuls, dependent: :destroy

   FILE_NUMBER_LIMIT = 5

   validates :title, presence: true
   validates :review_item, presence: true
   validates :feeling, presence: true
   validates :review_images, presence: true

   validate :validate_number_of_files

   def get_review_images
     unless review_images.attached?
       file_path = Rails.root.join('app/assets/images/no_image.jpg')
       review_images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
     end
     review_images
   end

   def self.search(keyword)
     where("title LIKE ? or review_item LIKE ? or feeling LIKE ?",  "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
   end

   def usefuld_by?(end_user)
     usefuls.exists?(end_user_id: end_user.id)
   end

   private

  def validate_number_of_files
    return if review_images.length <= FILE_NUMBER_LIMIT
    errors.add(:review_images, "添付できる画像は#{FILE_NUMBER_LIMIT}枚までです。")
  end
end
