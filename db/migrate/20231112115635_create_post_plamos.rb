class CreatePostPlamos < ActiveRecord::Migration[6.1]
  def change
    create_table :post_plamos do |t|
      t.integer :end_user_id, null: false
      t.text :introduction, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
