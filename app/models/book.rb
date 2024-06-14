class Book < ApplicationRecord
  DEFAULT_BOOK_IMAGE = 'default_image_url_here' # Replace with your actual default image URL

  before_validation :set_default_image_url

  validates :title, :author, :description, :published_date, :image_url, presence: true

  private

  def set_default_image_url
    self.image_url ||= DEFAULT_BOOK_IMAGE
  end
end
