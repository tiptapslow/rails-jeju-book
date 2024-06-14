class AddDueDateToLoans < ActiveRecord::Migration[7.1]
  def change
    add_column :loans, :due_date, :datetime
  end
end
