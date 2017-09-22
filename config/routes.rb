Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :employees
  resources :appraisals, only: [:create, :destroy]
end
