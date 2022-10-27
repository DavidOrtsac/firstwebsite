class AddUserIdToHomeworks < ActiveRecord::Migration[7.0]
  def change
    add_column :homeworks, :user_id, :integer
    add_index :homeworks, :user_id
  end
end
