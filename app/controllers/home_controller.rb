class HomeController < ApplicationController
  def index
    if params[:query].present?
      @books = Book.where('title LIKE ? OR author LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%").page(params[:page]).per(5)
    else
      @books = Book.page(params[:page]).per(5)
    end
  end
end
