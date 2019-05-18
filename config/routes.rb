Rails.application.routes.draw do
  get 'posts/index'
  root 'posts#index'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, except: [:index, :new, :create]
  resources :posts, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
