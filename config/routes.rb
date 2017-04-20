Rails.application.routes.draw do
  

  get 'courses/new'

  get 'users/new'

  root "sessions#new"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'students/homepage', to: 'students#homepage', as: 'student_home_page'
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
