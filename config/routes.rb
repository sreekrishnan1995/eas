Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/pop',    to: 'static_pages#pop'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  

  get 'employees/select' => 'employees#select'
  get 'employees/succ' => 'employees#succ'
  get 'employees/view' => 'employees#view'
  get 'employees/sele' => 'employees#sele'
  get 'employees/evaluate' => 'employees#evaluate'



  get 'projectmanager/index' => 'projectmanager#index'
  get 'projectmanager/select' => 'projectmanager#select'
  get 'projectmanager/view' => 'projectmanager#view'
  get 'projectmanager/myview' => 'projectmanager#myview'

  get 'teamleader/index' => 'teamleader#index'
  get 'teamleader/view' => 'teamleader#view'
  get 'teamleader/myview' => 'teamleader#myview'
  get 'teamleader/select' => 'teamleader#select'

  get 'teammember/index' => 'teammember#index'
  get 'teammember/view' => 'teammember#view'

  get 'ceo/index' => 'ceo#index'
  get 'ceo/view' => 'ceo#view'
  
  resources :employees
  resources :appraisals
end
