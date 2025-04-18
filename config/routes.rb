Rails.application.routes.draw do
  resources :tasks do
    patch :trigger, on: :member
    resources :notes, only: [:create], controller: 'tasks/notes'
  end
  resources :categories

  root 'tasks#index'
end
