require 'rails_helper'

RSpec.describe "Randoms", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/randoms/index"
      expect(response).to have_http_status(:success)
    end
  end

end
