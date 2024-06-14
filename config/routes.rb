# routes.rb
Rails.application.routes.draw do

  # 새로운 로그인 경로 추가
  get 'login', to: 'users/sessions#new_login', as: :new_login
  post 'login', to: 'users/sessions#create'
  root 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :books, only: [:index, :show] do
    collection do
      get 'search', to: 'books#search', as: 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
  resources :loans, only: [:index, :create, :new] do
    member do
      patch :return_book
    end
  end

  namespace :admin do
    resources :books, only: [:new, :create, :edit, :update, :destroy]
    get 'default_loan_period', to: 'settings#loan_period', as: 'default_loan_period'
    patch 'update_loan_period', to: 'settings#update_loan_period', as: 'update_loan_period'
    get 'default_book_image', to: 'settings#book_image', as: 'default_book_image'
    patch 'update_book_image', to: 'settings#update_book_image', as: 'update_book_image'
  end
end
