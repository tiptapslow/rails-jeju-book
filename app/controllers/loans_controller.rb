# /Users/sk/projects/kimsk/rails/jeju_book/app/controllers/loans_controller.rb
class LoansController < ApplicationController
  before_action :authenticate_user!

  def index
    @loans = current_user.loans
  end

  def new
    @book = Book.find(params[:book_id])
    @loan = Loan.new
    render layout: false
  end

  def create
    @loan = current_user.loans.new(loan_params)
    @loan.loaned_at = Time.current
    @loan.due_date = Time.current + Loan::DEFAULT_LOAN_PERIOD
    if @loan.save
      redirect_to root_path, notice: 'Book was successfully borrowed.'
    else
      render :new
    end
  end

  def return_book
    @loan = Loan.find(params[:id])
    if @loan.update(returned_at: Time.current)
      redirect_to user_path(current_user), notice: 'Book was successfully returned.'
    else
      redirect_to user_path(current_user), alert: 'Failed to return the book.'
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:book_id)
  end
end
