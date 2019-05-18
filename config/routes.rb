Rails.application.routes.draw do
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users, except: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
