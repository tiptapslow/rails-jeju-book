# Pin npm packages by running ./bin/importmap

pin "application"
pin "loans", to: "loans.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
