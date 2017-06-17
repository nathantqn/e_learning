Rails.application.routes.draw do

  # Route for custom function
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end


  match 'users/doit' => 'users#doit',  via: [:post], as: :doit

  get 'lecturers/homepage'

  get 'topic_scores/create'

  get 'register_courses/new'

  get 'register_courses/create'

  get 'courses/new'

  get 'users/new'

  root "sessions#new"
  get    '/test',   to: 'users#testpost'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'students/homepage',
  to: 'students#homepage',
  as: 'student_home_page'

  get 'lecturers/homepage',
  to: 'lecturers#homepage',
  as: 'lecturer_home_page'

  get 'students/registerCourse',
  to: 'students#register_course',
  as: 'student_register_course'
  resources :topics
  resources :comments
  resources :topic_scores
  resources :courses
  resources :register_courses,     only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
