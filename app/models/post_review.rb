class PostReview < ApplicationRecord

   has_one_attached :review_item_image
   belongs_to :end_user

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
end
