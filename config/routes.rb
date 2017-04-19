Rails.application.routes.draw do
  get 'students/homepage'

  get 'courses/new'

  get 'users/new'

  root "sessions#new"
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
