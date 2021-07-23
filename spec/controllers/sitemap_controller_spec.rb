require 'rails_helper'

describe SitemapController do
  render_views
  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
