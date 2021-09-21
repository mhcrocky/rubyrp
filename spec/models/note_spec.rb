require 'rails_helper'

RSpec.describe Note, type: :model do

  describe "creation" do
    let(:note) { FactoryBot.create(:note) }
    it "can be created" do
      expect(note).to be_valid
    end
  end

  describe "validations" do
    let(:note) { FactoryBot.build(:note) }
    it "should have a room" do
      note.room = nil
      expect(note).to_not be_valid
    end
    it "should have a user" do
      note.user = nil
      expect(note).to_not be_valid
    end
    it "should have a body" do
      note.body = nil
      expect(note).to_not be_valid
    end
    it "should pass with all valid fields" do
      expect(note).to be_valid
    end
  end

  describe "created" do
    let(:note) { FactoryBot.build(:note) }
    it "should return a string containing a formatted created_at date" do
      expect(note.created).to eq("Today")
    end
  end

  describe "strip_body_for_tree" do
    let(:note) { FactoryBot.build(:note) }
    it "should return a stripped text" do
      expect(note.strip_body_for_tree).to eq("i am a note body  ")
    end
  end

end
