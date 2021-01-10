require 'rails_helper'

RSpec.describe "rooms/show.html.erb", type: :view do
  it "displays the room" do
    room = FactoryBot.create(:room)
  end
end
