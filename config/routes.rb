Rails.application.routes.draw do
  resources :requests
  resources :companies
  resources :users
	root 'static#home'

	get '/login' => "session#new"
	post '/login' => "session#create"
	get '/logout' => "session#destroy"

end
