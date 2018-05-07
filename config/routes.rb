Rails.application.routes.draw do

   root 'products#index'

    resources :orders, only: [:index]
    resources :deliveries , only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
