Rails.application.routes.draw do
  root 'tasks#index'

  # resources :users

  resources :tasks, shallow: true
  resources :tags, shallow: true

  get '/users/sign_up', to: 'registrations#new'
  post '/users', to: 'registrations#create'

end
