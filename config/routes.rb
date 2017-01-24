Rails.application.routes.draw do
  get 'home/index'

  get 'elections/index'

  get 'candidats/index'

  get 'users/index'
  post 'users/', to: 'users#selfcreate'

  get 'users/inscription'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
