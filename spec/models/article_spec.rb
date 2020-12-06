require 'rails_helper'

RSpec.describe Article, type: :model do

  describe "creation" do
    let(:article) { FactoryBot.create(:article) }
    it "can be created" do
      expect(article).to be_valid
    end
  end

  describe "validations" do
    let(:article) { FactoryBot.build(:article) }
    it "should have a title" do
      article.title = nil
      expect(article).to_not be_valid
    end
    it "should have a user" do
      article.user = nil
      expect(article).to_not be_valid
    end
  end

end
