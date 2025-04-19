Rails.application.routes.draw do
  resources :tasks do
    patch :trigger, on: :member
    resources :notes, only: [:create], controller: 'tasks/notes'
  end
  resources :categories

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'tasks#index'
end
