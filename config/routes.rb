Rails.application.routes.draw do

  root 'courses#index'
  # get 'courses/new', to: 'courses#new'
  get 'about', to: 'pages#about'
  resources :courses, except: [:index]
  resources :users
end
