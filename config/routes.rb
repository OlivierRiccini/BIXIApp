Rails.application.routes.draw do
  get 'users/profile'

  get 'stations/show'

  get 'stations/results'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
