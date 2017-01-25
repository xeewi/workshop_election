Rails.application.routes.draw do

	root 'home#index'

	get 'home/index', as: 'home'
	get 'elections/index'
	get 'candidats/index'
	get 'users/index'

	# Admins
	get 'admin/login'
	post 'admin/login' => 'admin#auth'
	get 'admin/logout' => 'admin#logout'
	get 'admin' => 'home#admin'


  post 'users/', to: 'users#selfcreate'

  get 'users/inscription', as: 'inscription'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
