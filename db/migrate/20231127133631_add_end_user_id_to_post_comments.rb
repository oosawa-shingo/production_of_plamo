class AddEndUserIdToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :end_user_id, :string, null: false
  end
end
