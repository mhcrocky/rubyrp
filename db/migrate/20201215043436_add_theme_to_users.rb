class AddThemeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :dark_theme, :boolean, null: false, default: false
  end
end
