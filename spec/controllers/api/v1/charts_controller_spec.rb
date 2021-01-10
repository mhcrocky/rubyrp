require 'rails_helper'

describe Api::V1::ChartsController do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:sysadmin]
    @user = FactoryBot.create(:sysadmin)
    @user.roles << Role.where(name: 'sysadmin').first_or_create
    sign_in @user
  end

  ## Users
  describe "GET #month_of_year-superadmins" do
    it "renders the json" do
      get :month_of_year_superadmins
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year-admins" do
    it "renders the json" do
      get :month_of_year_admins
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year-members" do
    it "renders the json" do
      get :month_of_year_members
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year-visitors" do
    it "renders the json" do
      get :month_of_year_visitors
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year-users" do
    it "renders the json" do
      get :month_of_year_users
      expect(response.status).to eq(200)
    end
  end
  describe "GET #free_member-roles" do
    it "renders the json" do
      get :free_member_roles
      expect(response.status).to eq(200)
    end
  end
  describe "GET #user-themes" do
    it "renders the json" do
      get :user_themes
      expect(response.status).to eq(200)
    end
  end
  describe "GET #user-timezones" do
    it "renders the json" do
      get :user_timezones
      expect(response.status).to eq(200)
    end
  end

  ## Rooms
  describe "GET #month_of_year-rooms" do
    it "renders the json" do
      get :month_of_year_rooms
      expect(response.status).to eq(200)
    end
  end
  describe "GET #chat-rooms" do
    it "renders the json" do
      get :chat_rooms
      expect(response.status).to eq(200)
    end
  end

  ## Articles
  describe "GET #month_of_year_single-articles" do
    it "renders the json" do
      get :month_of_year_single_articles
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year-articles" do
    it "renders the json" do
      get :month_of_year_articles
      expect(response.status).to eq(200)
    end
  end
  describe "GET #free_member-articles" do
    it "renders the json" do
      get :free_member_articles
      expect(response.status).to eq(200)
    end
  end

  ## Todo Items
  describe "GET #complete_incomplete_single-todos" do
    it "renders the json" do
      get :complete_incomplete_single_todos
      expect(response.status).to eq(200)
    end
  end
  describe "GET #complete_incomplete-todos" do
    it "renders the json" do
      get :complete_incomplete_todos
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_single-todos" do
    it "renders the json" do
      get :month_of_year_single_todos
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year-todos" do
    it "renders the json" do
      get :month_of_year_todos
      expect(response.status).to eq(200)
    end
  end

end
