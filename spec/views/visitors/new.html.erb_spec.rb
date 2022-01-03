require 'rails_helper'

RSpec.describe "visitors/new.html.erb", type: :view do
  it "displays visitors and adds default visitor role" do
    visitor = FactoryBot.create(:visitor)
  end
end
