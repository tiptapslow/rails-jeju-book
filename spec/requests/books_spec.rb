require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /index" do
    it "returns a success response" do
      get books_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let(:book) { Book.create!(title: "Sample Title", author: "Sample Author", description: "Sample Description") }

    it "returns a success response" do
      get book_path(book)
      expect(response).to be_successful
    end
  end
end
