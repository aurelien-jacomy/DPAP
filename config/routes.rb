Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :companies, only: [:new, :create, :show] do
    member do 
      get 'fabrics' 
    end    
  end
  resources :fabrics, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]
  resources :company_user, only: [:create, :new, :update] 

  get 'cart', to: 'fabric_to_carts#show_user_cart'
  delete 'cart', to: 'fabric_to_carts#destroy_all'
  
  get 'my_company', to: 'companies#show'
  get 'search_company', to: 'companies#search'
  resources :fabric_to_carts, only: [:destroy, :update, :create]
  post 'set_delivery_point', to: 'fabric_to_carts#set_delivery_point'

  resources :delivery_points, only: [:create, :destroy] do
  	member do
			get :as_favourite  		
  	end 
  end

  resources :payments, only: :new
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
