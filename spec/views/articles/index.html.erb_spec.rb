require 'rails_helper'

RSpec.describe "articles/index.html.erb", type: :view do
  it "displays articles" do
    article = FactoryBot.create(:article)
  end
end
