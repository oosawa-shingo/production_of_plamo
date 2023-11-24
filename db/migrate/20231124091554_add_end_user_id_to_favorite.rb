class AddEndUserIdToFavorite < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :end_user_id, :integer
  end
end
