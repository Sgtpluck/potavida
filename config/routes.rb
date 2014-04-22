require 'resque/server'
Potaomg::Application.routes.draw do
  mount Resque::Server, :at => "/resque"
  
  root 'welcome#index'
  
  # get '/posts/new',       to: 'posts#new'
  # post'/posts/new',       to: 'posts#create'#, as: :posts
  # get '/posts/:id',       to: 'posts#show', as: :show_post
  # get '/posts/:id/edit',  to: 'posts#edit'
  # patch '/posts',         to: 'posts#update'
  # delete '/posts',        to: 'posts#destroy'
  # get '/blog',            to: 'posts#index'      

  resources :posts

  get '/graphs',                to: 'graphs#index'
  get '/graphs/bar',            to: 'graphs#bar'
  get '/graphs/histogram',      to: 'graphs#histogram'
  get '/graphs/map',            to: 'graphs#map'
  get '/graphs/batt',           to: 'graphs#batt'
  get '/graphs/date_range',     to: 'graphs#date_range'


  get '/signin',                to: 'sessions#new', as: :sign_in
  post '/signin',               to: 'sessions#sign_in'
  get '/signout',               to: 'sessions#destroy', as: :sign_out
  
  get '/profile/:id',           to: 'users#show', as: :user
  get '/users',                 to: 'users#index', as: :users
  get '/users/new',             to: 'users#new', as: :new_user
  post '/users',                to: 'users#create'
  get '/user/:id/edit',         to: 'users#edit', as: :edit_user
  patch '/profile/:id',         to: 'users#update'

  get '/user/role/:id',         to: 'users#change_user_role', as: :change_user_role
  patch '/user/role/:id',       to: 'users#update_user_role'

  post '/subscribe',            to: 'subscribers#create', as: :subscribers

  get '/press',                 to: 'press#index', as: :all_press
  get '/press/new',             to: 'press#new', as: :new_press
  post '/press/new',            to: 'press#create', as: :presses
  get '/press/:id/edit',        to: 'press#edit', as: :edit_press
  post '/press/:id/edit',       to: 'press#update'
  delete '/press/:id',          to: 'press#destroy', as: :destroy

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
