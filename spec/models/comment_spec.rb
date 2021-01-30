require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe "creation" do
    let(:comment) { FactoryBot.create(:comment) }
    it "can be created" do
      expect(comment).to be_valid
    end
  end

  describe "validations" do
    let(:comment) { FactoryBot.build(:comment) }
    it "should have an article" do
      comment.article = nil
      expect(comment).to_not be_valid
    end
    it "should have a user" do
      comment.user = nil
      expect(comment).to_not be_valid
    end
    it "should have a body" do
      comment.body = nil
      expect(comment).to_not be_valid
    end
    it "should pass with all valid fields" do
      expect(comment).to be_valid
    end
  end

end
