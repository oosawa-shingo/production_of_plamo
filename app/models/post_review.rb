class PostReview < ApplicationRecord

   has_one_attached :review_item_image
   belongs_to :end_user

   has_many :usefuls, dependent: :destroy

   validates :title, presence: true
   validates :review_item, presence: true
   validates :feeling, presence: true
   validates :review_item_image, presence: true

   def get_review_item_image
     unless review_item_image.attached?
       file_path = Rails.root.join('app/assets/images/no_image.jpg')
       image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
     end
     review_item_image
   end

   def self.search(keyword)
     where("title LIKE ? or review_item LIKE ? or feeling LIKE ?",  "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
   end

   def usefuld_by?(end_user)
     usefuls.exists?(end_user_id: end_user.id)
   end
end
