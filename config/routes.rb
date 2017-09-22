Rails.application.routes.draw do
  resources :employees
  resources :appraisals, only: [:create, :destroy]
end
