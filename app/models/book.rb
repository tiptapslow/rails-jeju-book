class Book < ApplicationRecord
  validates :title, :author, :description, :published_date, :image_url, presence: true
end
