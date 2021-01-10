require 'rails_helper'

describe Api::V1::RoomsController do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:sysadmin]
    @user = FactoryBot.create(:sysadmin)
    @user.roles << Role.where(name: 'sysadmin').first_or_create
    sign_in @user
  end

  describe "GET #index" do
    it "renders the json" do
      get :index
      expect(response.status).to eq(200)
    end
  end

end
