Rails.application.routes.draw do
  get '/zomg', to: 'movies#test', as: 'test'
  resources :movies
  resources :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
