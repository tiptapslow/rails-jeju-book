require 'rails_helper'

RSpec.describe "Loans", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/loans/index"
      expect(response).to have_http_status(:success)
    end
  end

end
