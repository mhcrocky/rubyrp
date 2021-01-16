class AddRoomKeyToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :room_key, :text
  end
end
