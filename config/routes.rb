Rails.application.routes.draw do
  

  get 'register_courses/new'

  get 'register_courses/create'

  get 'courses/new'

  get 'users/new'

  root "sessions#new"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'students/homepage', 
  to: 'students#homepage', 
  as: 'student_home_page'

  get 'students/registerCourse', 
  to: 'students#register_course', 
  as: 'student_register_course'
  resources :topics
  resources :comments
  resources :courses
  resources :register_courses,     only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
