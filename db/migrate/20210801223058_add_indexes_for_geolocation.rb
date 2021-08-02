class AddIndexesForGeolocation < ActiveRecord::Migration[6.1]
  def change
    add_index :ahoy_visits, [:latitude, :longitude]
  end
end
