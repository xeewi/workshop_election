Rails.application.routes.draw do

	root 'home#index'

	get 'home/index', as: 'home'
	get 'elections/index'
	get 'candidats/index'
	get 'users/index'

	# Auth & dash 
	get 'admin/login' #login
	get 'admin/logout' => 'admin#logout' #logout
	get 'admin' => 'home#admin' #dashboard

	post 'admin/login' => 'admin#auth' #login request

	# Users 
	get 'admin/users' => 'users#index'
	get 'admin/users/add' => 'users#add'
	get 'admin/users/:id' => 'users#show'

	post 'admin/users' => 'users#create'
	patch 'admin/users/:id' => 'users#edit'
	delete 'admin/users/:id' => 'users#delete'


  post 'users/', to: 'users#selfcreate'

  get 'users/inscription', as: 'inscription'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
