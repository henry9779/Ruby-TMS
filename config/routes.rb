Rails.application.routes.draw do
  root 'tasks#index'

  resources :users

  resources :tasks, shallow: true
  resources :tags, shallow: true

end
