require "rails_helper"

RSpec.describe ShowCreditComponent, type: :component do
  let(:article) { FactoryBot.build(:article) }
  let(:room) { FactoryBot.build(:room) }
  it "renders component" do
    #
  end
end

RSpec.describe "articles/show.html.erb", type: :view do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:sysadmin]
    @user = FactoryBot.create(:sysadmin)
    @user.roles << Role.where(name: 'sysadmin').first_or_create
    sign_in @user
  end
  it "displays the article name" do
    assign :article, FactoryBot.build(:article)

    # render
    # expect(rendered).to have_css("header h1")
  end
end

RSpec.describe "rooms/show.html.erb", type: :view do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:sysadmin]
    @user = FactoryBot.create(:sysadmin)
    @user.roles << Role.where(name: 'sysadmin').first_or_create
    sign_in @user
  end
  it "displays the room name" do
    assign :room, FactoryBot.build(:room)

    # render
    # expect(rendered).to have_css("header h1")
  end
end
