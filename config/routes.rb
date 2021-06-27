Rails.application.routes.draw do
  resources :tasks
  get 'tasks/index'
  root to: 'tasks#index'
end
