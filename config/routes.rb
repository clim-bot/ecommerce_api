# frozen_string_literal: true

Rails.application.routes.draw do
  # Mount the Swagger UI
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # Health Check Route
  get 'health', to: 'health#check'

  # User Authentication
  post 'register', to: 'users#create'
  post 'login', to: 'users#login'

  # Products CRUD
  resources :products, only: %i[index show create update destroy]

  # Cart Management
  resource :cart, only: [:show] do
    post 'add_item/:product_id', to: 'carts#add_item', as: 'add_item'
    delete 'remove_item/:product_id', to: 'carts#remove_item', as: 'remove_item'
  end

  # Order Management
  resources :orders, only: [:create]

  # Root Route (Optional)
  # root 'welcome#index' # Uncomment and customize if you want a root page
end
