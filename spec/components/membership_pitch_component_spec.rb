require "rails_helper"

RSpec.describe MembershipPitchComponent, type: :component do
  it "renders component" do
    #
  end
end

RSpec.describe "pages/welcome.html.erb", type: :view do
  it "displays the membership pitch" do
    # render
    # expect(rendered).to have_css("header h1")
  end
end

RSpec.describe "pages/dashboard.html.erb", type: :view do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:visitor]
    @user = FactoryBot.create(:visitor)
    @user.roles << Role.where(name: 'visitor').first_or_create
    sign_in @user
  end
  it "displays the membership pitch" do
    # render
    # expect(rendered).to have_css("header h1")
  end
end
