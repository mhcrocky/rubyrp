class AddAhoyToAssociatedModels < ActiveRecord::Migration[6.1]
  def change
    add_column :users,      :ahoy_visit_id, :bigint
    add_column :articles,   :ahoy_visit_id, :bigint
    add_column :rooms,      :ahoy_visit_id, :bigint
    add_column :todo_items, :ahoy_visit_id, :bigint
  end
end
