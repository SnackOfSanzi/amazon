Rails.application.routes.draw do

   root 'products#index'
    resources :orders, only: [:index]
    resources :parent_categories, only: [:index]
    resources :book_genres, only: [:index, :show]
    resources :reviews, only: [:new]
    resources :deliveries, only: [:index]
    resources :products, only: [:index, :show, :update] do
    collection do
      get 'search'

  end

    resources :orders, only: [:show]

      post '/add_product' => 'orders#add_product'
      patch '/update_product' => 'orders#update_product'
      delete '/delete_product' => 'orders#delete_product'
end
    end