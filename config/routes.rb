Rails.application.routes.draw do

  resources :movies

  get 'customers/index'

  get 'customers/show'

  get 'customers/new'

  get 'customers/create'

  get 'customers/destroy'

  get 'customers/edit'

  get 'customers/update'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
