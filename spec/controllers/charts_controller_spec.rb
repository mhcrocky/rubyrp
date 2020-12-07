require 'rails_helper'

describe ChartsController do

  ## Users
  describe "GET charts#month_of_year-users" do
    it "renders the json" do
      get :month_of_year_users
      expect(response.status).to eq(200)
    end
  end
  describe "GET charts#free_member-roles" do
    it "renders the json" do
      get :free_member_roles
      expect(response.status).to eq(200)
    end
  end

  ## Articles
  describe "GET charts#month_of_year-articles" do
    it "renders the json" do
      get :month_of_year_articles
      expect(response.status).to eq(200)
    end
  end
  describe "GET charts#free_member-articles" do
    it "renders the json" do
      get :free_member_articles
      expect(response.status).to eq(200)
    end
  end

  ## Todo Items
  describe "GET charts#complete_incomplete-todos" do
    it "renders the json" do
      get :complete_incomplete_todos
      expect(response.status).to eq(200)
    end
  end
  describe "GET charts#month_of_year-todos" do
    it "renders the json" do
      get :month_of_year_todos
      expect(response.status).to eq(200)
    end
  end

end
