class LoansController < ApplicationController
  before_action :authenticate_user!

  def index
    @loans = current_user.loans
  end

  def create
    @loan = current_user.loans.new(loan_params)
    if @loan.save
      redirect_to @loan, notice: 'Book was successfully borrowed.'
    else
      render :new
    end
  end

  def return_book
    @loan = Loan.find(params[:id])
    if @loan.update(returned_at: Time.current)
      redirect_to @loan, notice: 'Book was successfully returned.'
    else
      render :edit
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:book_id, :loaned_at)
  end
end
