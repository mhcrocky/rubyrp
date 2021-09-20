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
    it "should pass with all valid fields" do
      expect(article).to be_valid
    end
  end

  describe "iframe" do
    let(:article) { FactoryBot.build(:article) }
    it "should reject an invalid embed" do
      article.embed = nil
      expect(article.iframe).to be_nil
    end
    it "should reject an invalid embed" do
      article.embed = "I am an invalid embed"
      expect(article.iframe).to be_nil
    end
    it "should create an iframe with a browser url" do
      article.embed = "https://www.youtube.com/watch?v=u75Zsl1ECPQ"
      expect(article.iframe).to match("<iframe src='https://www.youtube.com/embed/u75Zsl1ECPQ' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>")
    end
    it "should create an iframe with a share link" do
      article.embed = "https://youtu.be/u75Zsl1ECPQ"
      expect(article.iframe).to match("<iframe src='https://www.youtube.com/embed/u75Zsl1ECPQ' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>")
    end
  end

  describe "thumb" do
    let(:article) { FactoryBot.build(:article) }
    it "should reject an invalid embed" do
      article.embed = nil
      expect(article.thumb).to be_nil
    end
    it "should reject an invalid embed" do
      article.embed = "I am an invalid embed"
      expect(article.thumb).to be_nil
    end
    it "should create an image with a browser url" do
      article.embed = "https://www.youtube.com/watch?v=u75Zsl1ECPQ"
      expect(article.thumb).to match("<img alt='Media' class='card-img-top' src='https://img.youtube.com/vi/u75Zsl1ECPQ/0.jpg' />")
    end
    it "should create an image with a share link" do
      article.embed = "https://youtu.be/u75Zsl1ECPQ"
      expect(article.thumb).to match("<img alt='Media' class='card-img-top' src='https://img.youtube.com/vi/u75Zsl1ECPQ/0.jpg' />")
    end
  end

  describe "created" do
    let(:article) { FactoryBot.build(:article) }
    it "should return a string containing a formatted created_at date" do
      expect(article.created).to eq("2 days ago")
    end
  end

  describe "updated" do
    let(:article) { FactoryBot.build(:article) }
    it "should return a string containing a formatted created_at date" do
      expect(article.updated).to eq("Today")
    end
  end

  describe "strip_title_for_tree" do
    let(:article) { FactoryBot.build(:article) }
    it "should return a stripped string" do
      expect(article.strip_title_for_tree).to eq("i am a title  ")
    end
  end

  describe "strip_text_for_tree" do
    let(:article) { FactoryBot.build(:article) }
    it "should return a stripped text" do
      expect(article.strip_text_for_tree).to eq("")
    end
  end

end
