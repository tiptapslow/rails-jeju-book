class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :loaned_at, presence: true
  validates :due_date, presence: true

  DEFAULT_LOAN_PERIOD = 14.days
end
