Rails.application.routes.draw do

   root 'parent_categories#index'
   resources :prodacts, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
