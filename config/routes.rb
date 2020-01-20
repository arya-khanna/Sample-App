Rails.application.routes.draw do
  root 'static_pages#home'
  
  get '/help',     to: 'static_pages#help'
  get '/about',    to: 'static_pages#about'
  get '/contact',  to: 'static_pages#contact'
  get '/signup',   to: 'users#new'
  get '/login',    to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
  
  
  # HTTP request	URL	Action	Named route	Purpose
  # GET	/users	index	users_path	page to list all users
  # GET	/users/1	show	user_path(user)	page to show user
  # GET	/users/new	new	new_user_path	page to make a new user (signup)
  # POST	/users	create	users_path	create a new user
  # GET	/users/1/edit	edit	edit_user_path(user)	page to edit user with id 1
  # PATCH	/users/1	update	user_path(user)	update user
  # DELETE	/users/1	destroy	user_path(user)	delete user
  resources :users
  
  
  # HTTP request	URL	Action	Named route
  # GET	/account_activation/<token>/edit	edit	edit_account_activation_url(token)
  resources :account_activations, only: [:edit]

end
