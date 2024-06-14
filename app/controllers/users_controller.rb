class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @loans = @user.loans.order(loaned_at: :desc)
  end

  def edit
    # edit 액션의 코드를 여기에 작성합니다.
  end

  def update
    # update 액션의 코드를 여기에 작성합니다.
  end
end
