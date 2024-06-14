class HomeController < ApplicationController
  def index
    @query = params[:query]
    @search_by = params[:search_by]

    if @query.present?
      if @search_by == 'title'
        @books = Book.where('title LIKE ?', "%#{@query}%").page(params[:page]).per(5)
      elsif @search_by == 'author'
        @books = Book.where('author LIKE ?', "%#{@query}%").page(params[:page]).per(5)
      else
        @books = Book.where('title LIKE ? OR author LIKE ?', "%#{@query}%", "%#{@query}%").page(params[:page]).per(5)
      end
    else
      @books = Book.page(params[:page]).per(5)
    end
  end
end
