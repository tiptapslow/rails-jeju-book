module Admin
  class SettingsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin!

    def loan_period
      @default_loan_period = Loan::DEFAULT_LOAN_PERIOD / 1.day
    end

    def book_image
      @default_book_image = Book::DEFAULT_BOOK_IMAGE
    end

    def update_loan_period
      new_period = params[:default_loan_period].to_i.days
      Loan.const_set(:DEFAULT_LOAN_PERIOD, new_period)
      flash[:notice] = "Default loan period updated to #{new_period / 1.day} days."
      redirect_to admin_default_loan_period_path
    rescue => e
      redirect_to admin_default_loan_period_path, alert: "Error updating default loan period: #{e.message}"
    end

    def update_book_image
      new_image = params[:default_book_image]
      Book.const_set(:DEFAULT_BOOK_IMAGE, new_image)
      flash[:notice] = "Default book image updated."
      redirect_to admin_default_book_image_path
    rescue => e
      redirect_to admin_default_book_image_path, alert: "Error updating default book image: #{e.message}"
    end

    private

    def authorize_admin!
      redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.admin?
    end
  end
end
