class RenameUsersColumnToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :users_id
    add_reference :cars, :user, foreign_key: true, null: false
  end
end
