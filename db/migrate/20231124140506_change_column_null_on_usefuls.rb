class ChangeColumnNullOnUsefuls < ActiveRecord::Migration[6.1]
  def change
    change_column_null :usefuls, :end_user_id, false
  end
end
