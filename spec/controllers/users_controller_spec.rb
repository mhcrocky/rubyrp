require 'rails_helper'

describe UsersController do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:sysadmin]
    @user = FactoryBot.create(:sysadmin)
    @user.roles << Role.where(name: 'sysadmin').first_or_create
    sign_in @user
  end

  render_views

  describe "GET #show" do
    it 'should render the show view' do
      get :show, params: { id: @user.id }
      expect(response.status).to eq(200)
    end
  end

end
