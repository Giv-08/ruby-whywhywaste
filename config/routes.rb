Rails.application.routes.draw do
  get 'cart/cart'
  devise_for :restaurants, controllers: {
    registrations: 'restaurants/registrations',
    sessions: 'restaurants/sessions'
  }
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "pages/auth", to: "pages#authentication", as: :auth
  # routes for pages
  resources :pages
  # Defined routes for the restaurants
  get 'restaurants/dashboard', to: 'restaurants/dashboard#dashboard'
  get 'users/dashboard', to: 'users/dashboard#dashboard'
  resources :restaurants do
    # Nested routes - foods belonging to restaurant
    resources :foods
    # Nested routes - reviews belonging to restaurant
    resources :reviews, only: [:index, :create, :new]
    # Nested routes - orders related to a specific restaurant
    resources :orders, only: [:index, :create]
  end

  get '/search', to: 'search#list', as: :search
  get '/search/map', to: 'search#map', as: :search_map

  get '/cart', to: 'cart#cart', as: :cart
  # Defines the root path route ("/")
  # root "posts#index"
end
