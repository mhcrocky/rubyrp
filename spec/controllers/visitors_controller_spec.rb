require 'rails_helper'

describe VisitorsController do


  render_views

  describe "GET #new" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:sysadmin]
      @user = FactoryBot.create(:sysadmin)
      @user.roles << Role.where(name: 'sysadmin').first_or_create
      sign_in @user
    end
    it "renders the :new view for a sysadmin" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "GET #new" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:superadmin]
      @user = FactoryBot.create(:superadmin)
      @user.roles << Role.where(name: 'superadmin').first_or_create
      sign_in @user
    end
    it "renders the :new view for a superadmin" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "GET #new" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @user = FactoryBot.create(:admin)
      @user.roles << Role.where(name: 'admin').first_or_create
      sign_in @user
    end
    it "denies access to an admin" do
      get :new
      expect(response.status).to eq(302)
    end
  end

  describe "GET #new" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:member]
      @user = FactoryBot.create(:member)
      @user.roles << Role.where(name: 'member').first_or_create
      sign_in @user
    end
    it "denies access to a member" do
      get :new
      expect(response.status).to eq(302)
    end
  end

  describe "GET #new" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:visitor]
      @user = FactoryBot.create(:visitor)
      @user.roles << Role.where(name: 'visitor').first_or_create
      sign_in @user
    end
    it "denies access to a visitor" do
      get :new
      expect(response.status).to eq(302)
    end
  end

end
