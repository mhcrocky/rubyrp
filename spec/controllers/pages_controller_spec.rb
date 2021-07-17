require 'rails_helper'

describe PagesController do

  render_views

  describe "GET #cookie_policy" do
    it "renders the :cookie_policy view without authentication" do
      get :cookie_policy
      expect(response.status).to eq(200)
    end
  end

  describe "GET #cookie_policy" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:sysadmin]
      @user = FactoryBot.create(:sysadmin)
      @user.roles << Role.where(name: 'sysadmin').first_or_create
      sign_in @user
    end
    it "renders the :cookie_policy view for a sysadmin" do
      get :cookie_policy
      expect(response.status).to eq(200)
    end
  end

  describe "GET #cookie_policy" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:superadmin]
      @user = FactoryBot.create(:superadmin)
      @user.roles << Role.where(name: 'superadmin').first_or_create
      sign_in @user
    end
    it "renders the :cookie_policy view for a superadmin" do
      get :cookie_policy
      expect(response.status).to eq(200)
    end
  end

  describe "GET #cookie_policy" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @user = FactoryBot.create(:admin)
      @user.roles << Role.where(name: 'admin').first_or_create
      sign_in @user
    end
    it "renders the :cookie_policy view for an admin" do
      get :cookie_policy
      expect(response.status).to eq(200)
    end
  end

  describe "GET #cookie_policy" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:member]
      @user = FactoryBot.create(:member)
      @user.roles << Role.where(name: 'member').first_or_create
      sign_in @user
    end
    it "renders the :cookie_policy view for a member" do
      get :cookie_policy
      expect(response.status).to eq(200)
    end
  end

  describe "GET #cookie_policy" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:visitor]
      @user = FactoryBot.create(:visitor)
      @user.roles << Role.where(name: 'visitor').first_or_create
      sign_in @user
    end
    it "renders the :cookie_policy view for a visitor" do
      get :cookie_policy
      expect(response.status).to eq(200)
    end
  end

  describe "GET #privacy_policy" do
    it "renders the :privacy_policy view without authentication" do
      get :privacy_policy
      expect(response.status).to eq(200)
    end
  end

  describe "GET #privacy_policy" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:sysadmin]
      @user = FactoryBot.create(:sysadmin)
      @user.roles << Role.where(name: 'sysadmin').first_or_create
      sign_in @user
    end
    it "renders the :privacy_policy view for a sysadmin" do
      get :privacy_policy
      expect(response.status).to eq(200)
    end
  end

  describe "GET #privacy_policy" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:superadmin]
      @user = FactoryBot.create(:superadmin)
      @user.roles << Role.where(name: 'superadmin').first_or_create
      sign_in @user
    end
    it "renders the :privacy_policy view for a superadmin" do
      get :privacy_policy
      expect(response.status).to eq(200)
    end
  end

  describe "GET #privacy_policy" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @user = FactoryBot.create(:admin)
      @user.roles << Role.where(name: 'admin').first_or_create
      sign_in @user
    end
    it "renders the :privacy_policy view for an admin" do
      get :privacy_policy
      expect(response.status).to eq(200)
    end
  end

  describe "GET #privacy_policy" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:member]
      @user = FactoryBot.create(:member)
      @user.roles << Role.where(name: 'member').first_or_create
      sign_in @user
    end
    it "renders the :privacy_policy view for a member" do
      get :privacy_policy
      expect(response.status).to eq(200)
    end
  end

  describe "GET #privacy_policy" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:visitor]
      @user = FactoryBot.create(:visitor)
      @user.roles << Role.where(name: 'visitor').first_or_create
      sign_in @user
    end
    it "renders the :privacy_policy view for a visitor" do
      get :privacy_policy
      expect(response.status).to eq(200)
    end
  end

  describe "GET #sitemap" do
    it "renders the :sitemap view without authentication" do
      get :sitemap
      expect(response.status).to eq(200)
    end
  end

  describe "GET #sitemap" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:sysadmin]
      @user = FactoryBot.create(:sysadmin)
      @user.roles << Role.where(name: 'sysadmin').first_or_create
      sign_in @user
    end
    it "renders the :sitemap view for a sysadmin" do
      get :sitemap
      expect(response.status).to eq(200)
    end
  end

  describe "GET #sitemap" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:superadmin]
      @user = FactoryBot.create(:superadmin)
      @user.roles << Role.where(name: 'superadmin').first_or_create
      sign_in @user
    end
    it "renders the :sitemap view for a superadmin" do
      get :sitemap
      expect(response.status).to eq(200)
    end
  end

  describe "GET #sitemap" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @user = FactoryBot.create(:admin)
      @user.roles << Role.where(name: 'admin').first_or_create
      sign_in @user
    end
    it "renders the :sitemap view for an admin" do
      get :sitemap
      expect(response.status).to eq(200)
    end
  end

  describe "GET #sitemap" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:member]
      @user = FactoryBot.create(:member)
      @user.roles << Role.where(name: 'member').first_or_create
      sign_in @user
    end
    it "renders the :sitemap view for a member" do
      get :sitemap
      expect(response.status).to eq(200)
    end
  end

  describe "GET #sitemap" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:visitor]
      @user = FactoryBot.create(:visitor)
      @user.roles << Role.where(name: 'visitor').first_or_create
      sign_in @user
    end
    it "renders the :sitemap view for a visitor" do
      get :sitemap
      expect(response.status).to eq(200)
    end
  end

  describe "GET #terms_and_conditions" do
    it "renders the :terms_and_conditions view without authentication" do
      get :terms_and_conditions
      expect(response.status).to eq(200)
    end
  end

  describe "GET #terms_and_conditions" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:sysadmin]
      @user = FactoryBot.create(:sysadmin)
      @user.roles << Role.where(name: 'sysadmin').first_or_create
      sign_in @user
    end
    it "renders the :terms_and_conditions view for a sysadmin" do
      get :terms_and_conditions
      expect(response.status).to eq(200)
    end
  end

  describe "GET #terms_and_conditions" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:superadmin]
      @user = FactoryBot.create(:superadmin)
      @user.roles << Role.where(name: 'superadmin').first_or_create
      sign_in @user
    end
    it "renders the :terms_and_conditions view for a superadmin" do
      get :terms_and_conditions
      expect(response.status).to eq(200)
    end
  end

  describe "GET #terms_and_conditions" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @user = FactoryBot.create(:admin)
      @user.roles << Role.where(name: 'admin').first_or_create
      sign_in @user
    end
    it "renders the :terms_and_conditions view for an admin" do
      get :terms_and_conditions
      expect(response.status).to eq(200)
    end
  end

  describe "GET #terms_and_conditions" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:member]
      @user = FactoryBot.create(:member)
      @user.roles << Role.where(name: 'member').first_or_create
      sign_in @user
    end
    it "renders the :terms_and_conditions view for a member" do
      get :terms_and_conditions
      expect(response.status).to eq(200)
    end
  end

  describe "GET #terms_and_conditions" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:visitor]
      @user = FactoryBot.create(:visitor)
      @user.roles << Role.where(name: 'visitor').first_or_create
      sign_in @user
    end
    it "renders the :terms_and_conditions view for a visitor" do
      get :terms_and_conditions
      expect(response.status).to eq(200)
    end
  end

end
