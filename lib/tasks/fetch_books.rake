require 'net/http'
require 'json'

namespace :books do
  desc "Fetch books from Open Library API and save to database"
  task fetch: :environment do
    base_url = "http://openlibrary.org/search.json"
    query = "fiction"
    category = "Fiction"

    url = "#{base_url}?q=#{query}&limit=100"

    uri = URI(url)
    response = Net::HTTP.get(uri)
    books = JSON.parse(response)["docs"]

    books.each do |item|
      title = item["title"]
      author = item["author_name"]&.join(", ") || "Unknown"
      description = "No description available"
      published_date = item["first_publish_year"]&.to_s || "No published date available"
      image_url = item["cover_i"] ? "http://covers.openlibrary.org/b/id/#{item['cover_i']}-L.jpg" : "No image available"

      Book.create(
        title: title,
        author: author,
        description: description,
        published_date: published_date,
        image_url: image_url,
        category: category
      )
    end

    puts "Books have been successfully fetched and saved!"
  end
end
