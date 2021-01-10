require 'rails_helper'

RSpec.describe "rooms/index.html.erb", type: :view do
  it "displays rooms" do
    room = FactoryBot.create(:room)
  end
end
