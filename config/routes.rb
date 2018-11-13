Rails.application.routes.draw do



  post '/users/signup' => 'users#create'
  post '/users/signin' => 'user_token#create'

  put 'users/:user_id/profile' => 'users#update'
  patch 'users/:user_id/profile' => 'users#update'

  post '/users/:user_id/follow' => 'following#follow'
  post '/users/:user_id/unfollow' => 'following#unfollow'

  resources :users, except: [:index, :new, :edit, :show, :update, :create, :destroy] do
    resources :profile, except: [:new, :edit, :show, :update, :destroy]
    resources :tweet, except: [:new, :edit]
  end

  # post '/signup' => 'user#create'
  # post '/signin' => 'user#get'

  # get '/profile' => 'profile#show'
  # post '/profile' => 'profile#create'
  # patch '/profile' => 'profile#update'
  #
  # post '/tweets' => 'tweet#create'
  # get '/tweets' => 'tweet#index'
  # get '/tweets/:id' => 'tweet#show'
  # patch '/tweets/:tweet_id' => 'tweet#update'
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
end
