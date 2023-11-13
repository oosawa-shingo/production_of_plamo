class CreatePostReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :post_reviews do |t|
      t.integer :end_user_id, null: false
      t.string :title, null: false
      t.string :review_item, null: false
      t.text :feeling, null: false

      t.timestamps
    end
  end
end
