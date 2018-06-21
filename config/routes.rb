Rails.application.routes.draw do

   devise_for :users
   root 'products#index'
   resources :orders, only: [:index]
   resources :deliveries , only: [:index]
   resources :parent_categories, only: [:index]
   resources :book_genres, only: [:index, :show]
   resources :reviews, only: [:new]
   resources :products, only: [:index, :show, :update] do
     resources :orders, only: [:show]

      post '/add_product' => 'orders#add_product'
      patch '/update_product' => 'orders#update_product'
      delete '/delete_product' => 'orders#delete_product'
    collection do
      get 'search'
    end
   end
    resources :tokens, only: [:new ,:index] do
      collection do
        post 'token'
        get 'pay'
      end
    end


end
