Rails.application.routes.draw do

	root 'home#index'

	get 'home/index'
	get 'elections/index'
	get 'candidats/index'
	get 'users/index'

	# Admins
	get 'admin/login'
	post 'admin/login' => 'admin#auth'
	get 'admin/logout' => 'admin#logout'
	get 'admin' => 'home#admin'

end
