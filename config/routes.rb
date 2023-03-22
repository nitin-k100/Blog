Rails.application.routes.draw do
  root to:'homepage#index'
  get 'users/show', to: 'users#show'
  get 'users/login', to:'users#login', as: :login
  post 'users/new', to:'users#create'
  post 'users/login', to:'users#login_'
  get '/logout',to: 'users#destroy', as: :logout
  post 'users:id', to: 'posts#index'
  post 'posts/new', to: 'posts#create'
  post 'posts/:id', to: 'comments#create'
  resources :users, only: [:new,:create,:show,:index]
  resources :posts, only: [:new,:create,:show,:index]
  resources :comments, only: [:new,:create,:index]
  end

