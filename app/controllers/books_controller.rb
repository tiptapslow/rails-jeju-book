class BooksController < ApplicationController
  def index
    @books = Book.page(params[:page]).per(10) # 페이지당 10개의 책을 표시합니다.
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    if params[:query].present?
      @books = Book.where("name LIKE ? OR author LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @books = []
    end
    render :search
  end
end
