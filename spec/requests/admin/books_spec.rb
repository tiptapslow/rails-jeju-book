require 'rails_helper'

RSpec.describe "Admin::Books", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/admin/books/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/admin/books/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admin/books/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/admin/books/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/admin/books/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
