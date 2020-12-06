require 'rails_helper'

RSpec.describe "todo_items/index.html.erb", type: :view do
  it "displays todo items" do
    todo_item = FactoryBot.create(:todo_item)
  end
end
