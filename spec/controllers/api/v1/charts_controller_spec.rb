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

  ## Articles
  describe "GET #article-likes" do
    it "renders the json" do
      get :article_likes
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_article-likes" do
    it "renders the json" do
      get :month_of_year_article_likes
      expect(response.status).to eq(200)
    end
  end
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

  ## Analytics
  describe "GET #month_of_year-visits" do
    it "renders the json" do
      get :month_of_year_visits
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_visit-events" do
    it "renders the json" do
      get :month_of_year_visit_events
      expect(response.status).to eq(200)
    end
  end
  describe "GET #device-type" do
    it "renders the json" do
      get :device_type
      expect(response.status).to eq(200)
    end
  end
  describe "GET #os-type" do
    it "renders the json" do
      get :os_type
      expect(response.status).to eq(200)
    end
  end
  describe "GET #browser-type" do
    it "renders the json" do
      get :browser_type
      expect(response.status).to eq(200)
    end
  end
  describe "GET #landing-pages" do
    it "renders the json" do
      get :landing_pages
      expect(response.status).to eq(200)
    end
  end
  describe "GET #visit-mapping" do
    it "renders the json" do
      get :visit_mapping
      expect(response.status).to eq(200)
    end
  end
  describe "GET #visit-country" do
    it "renders the json" do
      get :visit_country
      expect(response.status).to eq(200)
    end
  end
  describe "GET #visit-region" do
    it "renders the json" do
      get :visit_region
      expect(response.status).to eq(200)
    end
  end
  describe "GET #visit-city" do
    it "renders the json" do
      get :visit_city
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_viewed-welcome" do
    it "renders the json" do
      get :month_of_year_viewed_welcome
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_viewed-dashboard" do
    it "renders the json" do
      get :month_of_year_viewed_dashboard
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_viewed-blog" do
    it "renders the json" do
      get :month_of_year_viewed_blog
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_viewed-rooms" do
    it "renders the json" do
      get :month_of_year_viewed_rooms
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_viewed-list" do
    it "renders the json" do
      get :month_of_year_viewed_list
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_viewed_article" do
    it "renders the json" do
      get :month_of_year_viewed_article
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_viewed-room" do
    it "renders the json" do
      get :month_of_year_viewed_room
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_viewed-user" do
    it "renders the json" do
      get :month_of_year_viewed_user
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_viewed-terms" do
    it "renders the json" do
      get :month_of_year_viewed_terms
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_viewed_privacy-policy" do
    it "renders the json" do
      get :month_of_year_viewed_privacy_policy
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_viewed_cookies-policy" do
    it "renders the json" do
      get :month_of_year_viewed_cookies_policy
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_viewed-sitemap" do
    it "renders the json" do
      get :month_of_year_viewed_sitemap
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_viewed-cheat-sheet" do
    it "renders the json" do
      get :month_of_year_viewed_cheat_sheet
      expect(response.status).to eq(200)
    end
  end
  describe "GET #month_of_year_viewed-public-statistics" do
    it "renders the json" do
      get :month_of_year_viewed_public_statistics
      expect(response.status).to eq(200)
    end
  end

end
