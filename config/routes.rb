Rails.application.routes.draw do

  devise_for :users
   root 'products#index'

    resources :orders, only: [:index]
    resources :deliveries , only: [:index]
   resources :parent_categories, only: [:index]
   resources :book_genres, only: [:index, :show]
   resources :reviews, only: [:new]
   resources :products, only: [:index, :show, :update]
end
