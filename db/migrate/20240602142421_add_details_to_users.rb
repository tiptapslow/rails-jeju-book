class AddNicknameAndUserTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nickname, :string, null: false, default: ""
    add_column :users, :user_type, :string, null: false, default: ""
    add_index :users, :nickname, unique: true
    add_index :users, :user_type
  end
end
