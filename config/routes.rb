Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :fabrics, only: :index 

  get 'cart', to: 'orders#show_user_cart'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
