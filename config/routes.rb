Rails.application.routes.draw do

  root to: "home#index"

  get 'users/profile'

  get '/results', to: "stations#results"

  resources :stations, only: [ 'show', 'create', 'update', 'destroy' ]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
