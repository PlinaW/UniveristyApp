Rails.application.routes.draw do

  root 'courses#index'
  # get 'courses/new', to: 'courses#new'
  get 'about', to: 'pages#about'
  resources :courses, except: [:index]
  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'course_enroll', to: 'user_courses#create'


end
