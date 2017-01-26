Rails.application.routes.draw do

	root 'home#index'

	get 'home/index', as: 'home'
	get 'elections/home'
	get 'users/index'
	get 'users/inscription', as: 'inscription'

	post 'users/', to: 'users#selfcreate'

	# Admin Auth 
	get 'admin/login'
	get 'admin/logout' => 'admin#logout' 

	post 'admin/login' => 'admin#auth'

	# Admin dashboard
	get 'admin' => 'home#admin'

	# Admin Users 
	get 'admin/users' => 'users#index'
	get 'admin/users/add' => 'users#add'
	get 'admin/users/:id' => 'users#show'

	post 'admin/users' => 'users#create'
	patch 'admin/users/:id' => 'users#edit'
	delete 'admin/users/:id' => 'users#delete'

	# Admin Elections
	get 'admin/elections' => 'elections#index'
	get 'admin/elections/add' => 'elections#add'
	get 'admin/elections/:id' => 'elections#show'

	post 'admin/elections' => 'elections#create'
	patch 'admin/elections/:id' => 'elections#edit'
	delete 'admin/elections/:id' => 'elections#delete'	

	# Admin Elections types
	get 'admin/elections/types/add' => 'elections#types_add'
	get 'admin/elections/types/:id' => 'elections#types_show'

	post 'admin/elections/types' => 'elections#types_create'
	patch 'admin/elections/types/:id' => 'elections#types_edit'
	delete 'admin/elections/types/:id' => 'elections#types_delete'	

	# Admin Elections candidates
	get 'admin/elections/:id/candidats/add' => 'elections#candidats_add'
	get 'admin/elections/:id/candidats/:candidat_id' => 'elections#candidats_show'

	post 'admin/elections/:id/candidats' => 'elections#candidats_create'
	patch 'admin/elections/:id/candidats/:candidat_id' => 'elections#candidats_edit'
	delete 'admin/elections/:id/candidats/:candidat_id' => 'elections#candidats_delete'	

	# Admin Candidats
	get 'admin/candidats' => 'candidats#index'
	get 'admin/candidats/add' => 'candidats#add'
	get 'admin/candidats/:id' => 'candidats#show'

	post 'admin/candidats' => 'candidats#create'
	patch 'admin/candidats/:id' => 'candidats#edit'
	delete 'admin/candidats/:id' => 'candidats#delete'

	# Admin Admins
	get 'admin/admins' => 'admin#index'
	get 'admin/admins/add' => 'admin#add'
	get 'admin/admins/:id' => 'admin#show'

	post 'admin/admins' => 'admin#create'
	patch 'admin/admins/:id' => 'admin#edit'
	patch 'admin/admins/password/:id' => 'admin#edit_password'
	delete 'admin/admins/:id' => 'admin#delete'	


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
