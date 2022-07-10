Rails.application.routes.draw do
  root 'sessions#new'
  namespace :admin do
    resources :users
  end
  resources :tasks
  resources :users, only: %i[ new create show destroy]
  resources :sessions, only: %i[ new create destroy]
end
