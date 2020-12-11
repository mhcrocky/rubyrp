require 'rails_helper'

RSpec.describe "members/index.html.erb", type: :view do
  it "displays members" do
    member = FactoryBot.create(:member)
  end
end
