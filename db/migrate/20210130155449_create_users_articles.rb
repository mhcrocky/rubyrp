class CreateUsersArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :users_articles do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
