Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :companies, only: [:new, :create] 
  resources :fabrics, only: [ :index, :show ] 
  resources :company_user, only: [:create, :new, :update] 

  get 'cart', to: 'fabric_to_carts#show_user_cart'
  get 'my_company', to: 'companies#show'
  get 'search_company', to: 'companies#search'
  resources :fabric_to_carts, only: [:destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
