Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'sessions#index'

  resources :users, only: [:new, :create, :index]
  resources :notes

  get  '/login'    => 'sessions#login'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
end
