require 'rails_helper'

RSpec.describe User, type: :model do

  describe "creation" do
    let!(:user) { FactoryBot.create(:user) }
    it "can be created" do
      expect(user).to be_valid
    end
  end

  describe "validations" do
    let(:user) { FactoryBot.build(:user) }
    let(:duplicate_user) { FactoryBot.build(:user) }
    it "must have an email address" do
      user.email = nil
      expect(user).to_not be_valid
    end
    it "must have a unique email address" do
      user.save!
      duplicate_user.email = user.email
      expect(duplicate_user).to_not be_valid
    end
    it "must have a password" do
      user.password = nil
      expect(user).to_not be_valid
    end
  end

  describe "name" do
    let(:user) { FactoryBot.build(:user) }
    it "should create the username by splitting email" do
      user.email = "person@example.com"
      expect(user.name).to match("person")
    end
  end

  describe "todo_item associations" do
    let!(:user_with_todo_items) { FactoryBot.create(:user_with_todo_items) }
    it "has many todo items" do
      relation = described_class.reflect_on_association(:todo_items)
      expect(relation.macro).to eq(:has_many)
    end
    it "destroys associated todo_items" do
      expect{ user_with_todo_items.destroy }.to change { TodoItem.count }.by(-7) ## 5 (factory) + 2 (first_items method after_create)
    end
  end

end
