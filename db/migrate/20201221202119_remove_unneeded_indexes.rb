class RemoveUnneededIndexes < ActiveRecord::Migration[6.0]
  def change
    remove_index :users_roles, name: "index_users_roles_on_user_id", column: :user_id
  end
end
