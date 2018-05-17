Rails.application.routes.draw do

   root 'products#index'

    resources :orders, only: [:index]
    resources :deliveries , only: [:index]
   resources :parent_categories, only: [:index]
   resources :book_genres, only: [:index, :show]
   resources :reviews, only: [:new]
   resources :products, only: [:index, :show, :update] do
    collection do
      get 'search'
    end
   end
      resources :tokens, only: [:new ] do
        collection do
          post 'token'
          get 'pay'
        end
      end

end
