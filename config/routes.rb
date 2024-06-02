Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  root 'home#index'
  resources :books, only: [:index, :show]
end
