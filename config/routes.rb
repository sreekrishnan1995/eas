Rails.application.routes.draw do
  resources :employees do
    resources :appraisals
  end
end
