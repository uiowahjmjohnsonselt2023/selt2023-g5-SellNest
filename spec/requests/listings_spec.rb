require 'rails_helper'

RSpec.describe "Listings", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/listings/index"
      expect(response).to have_http_status(:success)
    end
  end

end
