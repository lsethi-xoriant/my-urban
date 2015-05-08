Rails.application.routes.draw do

  
  post 'events/upload_picture'

  resources :pictures





  resources :avatars
  post 'background_create' => 'avatars#background_create'
  patch 'background_update/:id' => 'avatars#background_update'

  resources :cities

  resources :states

  resources :friendships do
    member do
      post 'resolve'
    end
  end

  get 'autocomplete' => 'cities#autocomplete'

  post 'sent_invites' => 'plans#sent_invites'
  get 'invite' => 'plans#invite'
  post 'create_invite' => 'plans#create_invite'
  post 'user_answer' => 'plans#user_answer'
  resources :plans

  resources :categories

  resources :events

  get 'home/index'

  get 'ownpage' => 'users#own_user'
  get 'users' => 'users#index'
  #get 'users_controller/index'
  get 'profile' => 'users#profile'
  #get 'users_controller/profile'
  get 'user_friends/:id' => 'users#user_friends', as: 'user_friends'
  get 'user_info/:id' => 'users#user_info'
  get 'user_events/:id' => 'users#user_events', as: 'user_events'
  get 'user_photo/:id' => 'users#user_photo'

  get 'user_event' => 'users#user_event'

  devise_for :users



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  get 'filter' => 'events#filter'
  get 'filter_events' => 'events#filter_events'

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
