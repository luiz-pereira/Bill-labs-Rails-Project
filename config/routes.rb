Rails.application.routes.draw do


  resources :companies
	resources :users do
		resources :requests
	end

	namespace :admin do
		resources :companies
		resources :requests
		resources :users do
			resources :requests
			resources :users
		end
		root 'static#home'
		get '/login' => "session#new"
		post '/login' => "session#create"
		get '/logout' => "session#destroy"
	end

	root 'static#home'

	get '/login' => "session#new"
	post '/login' => "session#create"
	get '/logout' => "session#destroy"
	get '/auth/linkedin/callback' => "session#create"

end
