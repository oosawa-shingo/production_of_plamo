class CreateTagTables < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_tables do |t|
      t.integer :post_plamo_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
