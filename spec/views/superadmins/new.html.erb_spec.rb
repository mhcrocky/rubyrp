require 'rails_helper'

RSpec.describe "superadmins/new.html.erb", type: :view do
  it "displays superadmins" do
    superadmin = FactoryBot.create(:superadmin)
  end
end
