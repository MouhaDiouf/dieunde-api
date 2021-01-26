Rails.application.routes.draw do
  default_url_options :host => "localhost:3001"

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :produits
  resources :users
  post '/create_liker', to: 'produits#create_liker'
  get '/favorites', to: 'users#favorites'
  get '/user/:id/products', to: 'users#get_created_products'
  delete '/favorites', to: 'users#remove_favorite'
  get '/admin/products', to: 'produits#admin_index'
  post '/admin/validate_product/:id', to: 'produits#validate_product'
  post '/upload_image', to: 'produits#upload_image'
  delete '/delete_image', to: 'produits#delete_image'
  post '/admin/add_to_selection/:id', to: 'produits#add_to_selection'
end
