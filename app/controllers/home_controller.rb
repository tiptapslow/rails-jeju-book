class HomeController < ApplicationController
  def index
    @query = params[:query]
    if @query.present?
      @books = Book.where('title LIKE ?', "%#{@query}%").page(params[:page]).per(5)
    else
      @books = Book.page(params[:page]).per(5)
    end
  end
end
