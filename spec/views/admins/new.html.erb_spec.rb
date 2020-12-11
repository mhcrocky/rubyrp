require 'rails_helper'

RSpec.describe "admins/new.html.erb", type: :view do
  it "displays admins" do
    admin = FactoryBot.create(:admin)
  end
end
