require 'rails_helper'

RSpec.describe "users/show.html.erb", type: :view do
  it "displays the user" do
    user = FactoryBot.create(:user)
  end
end
