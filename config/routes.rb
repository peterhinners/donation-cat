Rails.application.routes.draw do


  root 'welcome#index'
  get 'welcome/news' => 'welcome#news', as: :news
  get 'welcome/swipe' => 'welcome#swipe'
  get 'charities/map' => 'charities#map_locations'

  get 'charities/login' => 'charities#identify', as: "charities_login"
  post 'charities/login' => 'charities#login'
  get 'charities/logout' => 'charities#destroy'

  resources :categories

  resources :users

  resources :charities do
    resources :wishlists
  end

  #Custom routes for search
  resources :search, only: [:index]

  #routes for sessions
  get 'users/login' => 'users#login'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  get 'charities/:id/profile' => 'charities#profile', as: :profile
  get '/about' => 'welcome#about'
  get '/categories/:id/interest' =>'categories#interest', as: :interest

  get 'charities/:id/star' => 'charities#star', as: :star
  get 'charities/:id/recently_visited' => 'charities#recently_visited', as: :recently_visited

  get 'charities/:id/map' => 'charities#map_location'


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
end
