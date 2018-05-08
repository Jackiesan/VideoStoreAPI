Rails.application.routes.draw do
  get 'rentals/check_in'

  get 'rentals/check_out'

  get '/zomg', to: 'movies#test', as: 'test'
  resources :movies
  resources :customers

  post 'rentals/check-out', to: 'rentals#check_out', as: 'check_out'
  post 'rentals/check-in', to: 'rentals#check_in', as: 'check_in'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
