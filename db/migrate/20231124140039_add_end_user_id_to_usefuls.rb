class AddEndUserIdToUsefuls < ActiveRecord::Migration[6.1]
  def change
    add_column :usefuls, :end_user_id, :integer
  end
end
