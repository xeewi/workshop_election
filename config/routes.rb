Rails.application.routes.draw do

	root 'home#index'

	get 'home/index', as: 'home'
	get 'elections/' => 'elections#index'
	# GET /elections/:id/candidats/ (candidats#home)
	get '/elections/:id/candidats/' => 'candidats#home'
	
	get 'users/index'
	get 'users/connexion' => 'users#signup'
  	get 'users/inscription', as: 'inscription'
 	post 'users/', to: 'users#selfcreate'
  
	# Admins
	get 'admin/login'
	post 'admin/login' => 'admin#auth'
	get 'admin/logout' => 'admin#logout'
	get 'admin' => 'home#admin'


 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
