Rails.application.routes.draw do
  root 'tasks#index'

  # resources :users

  resources :tasks, shallow: true
  resources :tags, shallow: true

  get '/users/sign_up', to: 'registrations#new'
  post '/users', to: 'registrations#create'

  get '/users/log_in', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/users/log_out', to: 'sessions#destroy'
end
