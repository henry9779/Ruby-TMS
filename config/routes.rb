Rails.application.routes.draw do
  root 'tasks#index'

  namespace :admin do
    resources :users
  end

  resources :tasks, shallow: true

  get '/sign_up', to: 'registrations#new'
  post '/registation', to: 'registrations#create'

  get '/log_in', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/log_out', to: 'sessions#destroy'

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
