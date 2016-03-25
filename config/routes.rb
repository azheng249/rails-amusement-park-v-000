Rails.application.routes.draw do
  resources :attractions
  resources :users
  
  post 'rides', to: 'rides#create', as: 'create_ride'

  get 'signin', to: 'sessions#new', as: 'new_session'
  post 'login', to: 'sessions#create', as: 'create_session'
  delete 'logout', to: 'sessions#destroy', as: 'destroy_session'

  resources :welcome, only: [:home]
  root 'welcome#home'
end