require 'rails_helper'

RSpec.describe "articles/show.html.erb", type: :view do
  it "displays the article" do
    article = FactoryBot.create(:article)
  end
end
