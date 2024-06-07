class AddDetailsToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :published_date, :string
    add_column :books, :category, :string unless column_exists?(:books, :category) # 카테고리 필드 추가
  end
end
