require 'rails_helper'

describe ArticlesController do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:sysadmin]
    @user = FactoryBot.create(:sysadmin)
    @user.roles << Role.where(name: 'sysadmin').first_or_create
    sign_in @user
  end

  render_views

  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    it 'should render the show view' do
      @article = FactoryBot.create(:article)
      get :show, params: { id: @article.id }
      expect(response.status).to eq(200)
    end
  end

  describe "GET #new" do
    it "renders the :new view" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "GET #edit" do
    it 'should render the edit view' do
      @article = FactoryBot.create(:article)
      get :edit, params: { id: @article.id }
      expect(response.status).to eq(200)
    end
  end

end
