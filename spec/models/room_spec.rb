require 'rails_helper'

RSpec.describe Room, type: :model do

  describe "creation" do
    let(:room) { FactoryBot.create(:room) }
    it "can be created" do
      expect(room).to be_valid
    end
  end

  describe "validations" do
    let(:room) { FactoryBot.build(:room) }
    it "should have a title" do
      room.name = nil
      expect(room).to_not be_valid
    end
    it "should have a user" do
      room.user = nil
      expect(room).to_not be_valid
    end
    it "should pass with all valid fields" do
      expect(room).to be_valid
    end
  end

  describe "twilio credentials" do
    let(:room) { FactoryBot.build(:room) }
    it "should create an ice_servers array" do
      room.name = "Test"
      room.save
      expect(room.room_key).to_not be_nil
    end
  end

end
