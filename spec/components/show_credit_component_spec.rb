require "rails_helper"

RSpec.describe ShowCreditComponent, type: :component do
  let(:article) { FactoryBot.build(:article) }
  let(:room) { FactoryBot.build(:room) }
  it "renders component" do
    #
  end
end

RSpec.describe "articles/show.html.erb", type: :view do
  it "displays the article name" do
    assign :article, FactoryBot.build(:article)
    assign :room, FactoryBot.build(:room)

    # render
    # expect(rendered).to have_css("header h1")
  end
end
