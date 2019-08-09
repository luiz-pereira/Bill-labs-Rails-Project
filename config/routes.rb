Rails.application.routes.draw do
  resources :requests
  resources :companies
  resources :users
  root 'static#home'
end
