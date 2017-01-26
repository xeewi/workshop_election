Rails.application.routes.draw do

	root 'home#index'

	get 'home/index', as: 'home'
	get 'elections/index'
	get 'candidats/index'
	get 'users/index'

	# Admin Auth 
	get 'admin/login'
	get 'admin/logout' => 'admin#logout' 

	post 'admin/login' => 'admin#auth'

	# Admin dashboard
	get 'admin' => 'home#admin' #dashboard

	# Admin Users 
	get 'admin/users' => 'users#index'
	get 'admin/users/add' => 'users#add'
	get 'admin/users/:id' => 'users#show'

	post 'admin/users' => 'users#create'
	patch 'admin/users/:id' => 'users#edit'
	delete 'admin/users/:id' => 'users#delete'

	# Admin Admins
	get 'admin/admins' => 'admin#index'
	get 'admin/admins/add' => 'admin#add'
	get 'admin/admins/:id' => 'admin#show'

	post 'admin/admins' => 'admin#create'
	patch 'admin/admins/:id' => 'admin#edit'
	patch 'admin/admins/password/:id' => 'admin#edit_password'
	delete 'admin/admins/:id' => 'admin#delete'	


  post 'users/', to: 'users#selfcreate'

  get 'users/inscription', as: 'inscription'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
