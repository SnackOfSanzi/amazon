Rails.application.routes.draw do

   root 'parent_categories#index'

   resources :parent_categories, only: [:index, :show]
   resources :products, only: [:index, :show]
end
