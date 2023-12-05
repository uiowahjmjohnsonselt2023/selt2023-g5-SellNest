Rails.application.routes.draw do
  get 'orders/show'
  root 'home#index'

  get 'user/index'
  get '/admin', to: 'admin#index'
  get '/cart', to: 'cart#show', as: 'cart_show'
  post '/cart/add_item/:id', to: 'cart#add_item', as: 'cart_add_item'
  delete '/cart/remove_item/:id', to: 'cart#remove_item', as: 'cart_remove_item'
  get 'cart/add_item'
  get 'cart/remove_item'
  post '/cart/checkout', to: 'cart#checkout', as: 'cart_checkout'
  #get 'signup', to: 'user#signup', as: 'signup'
  #post 'users', to: 'user#create'
  #get 'login', to: 'user#login', as: 'login'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :orders, only: [:show]
  #get 'user/:id', to: 'user#show', as: 'user'

  resources :listings
  post 'listings', to: 'listing#create'
  post '/admin', to: 'admin#index'
  # post 'update', to: 'listing#update', as: 'update'
  #
  resource :cart, only: [:show] do
    member do
      post 'add_item/:id', to: 'cart#add_item', as: :add_item_to
      delete 'remove_item/:id', to: 'cart#remove_item', as: :remove_item_from
    end
  end

  resources :users, only: [:show, :destroy] do
    member do
      match 'become_seller', via: [:get, :post]
    end
  end

end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end