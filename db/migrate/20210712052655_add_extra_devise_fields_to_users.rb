class AddExtraDeviseFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    ## Trackable
    add_column :users, :sign_in_count, :integer, default: 0
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
    ## Confirmable
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string # if config.reconfirmable = true
    add_index  :users, :confirmation_token, unique: true
    User.update_all confirmed_at: 1.hour.ago # existing users' confirmed_at fields
  end
end
