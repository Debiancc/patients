Rails.application.routes.draw do
  root 'patients#index'
  resources :patients
  resources :locations, only: [:show]
end
