Rails.application.routes.draw do
  root 'tasks#index'

  namespace :admin do
    resources :users
  end

  resources :tasks, shallow: true
  resources :tags, shallow: true

  get '/sign_up', to: 'registrations#new'
  post '/registation', to: 'registrations#create'

  get '/log_in', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/log_out', to: 'sessions#destroy'
end
