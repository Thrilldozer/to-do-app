Rails.application.routes.draw do

  devise_for :users

  get '/users' => 'users#show', as: :users_root # creates user_root_path

  namespace :users do
    root 'users#show' # creates user_root_path
  end

  resources :users do
    resources :items, only: [:create, :destroy]
  end

  root :to => 'home#index'

end
