class CreateUsefuls < ActiveRecord::Migration[6.1]
  def change
    create_table :usefuls do |t|
      t.integer :post_review_id, null: false

      t.timestamps
    end
  end
end
