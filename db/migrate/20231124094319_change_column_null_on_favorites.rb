class ChangeColumnNullOnFavorites < ActiveRecord::Migration[6.1]
  def change
    change_column_null :favorites, :end_user_id, false
  end
end
