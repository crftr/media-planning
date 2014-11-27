# == Route Map
#
#               Prefix Verb   URI Pattern                      Controller#Action
#                 root GET    /                                pages#index
#     new_user_session GET    /users/sign_in(.:format)         devise/sessions#new
#         user_session POST   /users/sign_in(.:format)         devise/sessions#create
# destroy_user_session DELETE /users/sign_out(.:format)        devise/sessions#destroy
#        user_password POST   /users/password(.:format)        devise/passwords#create
#    new_user_password GET    /users/password/new(.:format)    devise/passwords#new
#   edit_user_password GET    /users/password/edit(.:format)   devise/passwords#edit
#                      PATCH  /users/password(.:format)        devise/passwords#update
#                      PUT    /users/password(.:format)        devise/passwords#update
#                 user GET    /users/:id(.:format)             users#show
#            contracts GET    /contracts(.:format)             contracts#index
#                      POST   /contracts(.:format)             contracts#create
#         new_contract GET    /contracts/new(.:format)         contracts#new
#              clients GET    /clients(.:format)               clients#index
#                      POST   /clients(.:format)               clients#create
#           new_client GET    /clients/new(.:format)           clients#new
#          engagements GET    /engagements(.:format)           engagements#index
#                      POST   /engagements(.:format)           engagements#create
#       new_engagement GET    /engagements/new(.:format)       engagements#new
#              vendors GET    /vendors(.:format)               vendors#index
#                      POST   /vendors(.:format)               vendors#create
#           new_vendor GET    /vendors/new(.:format)           vendors#new
#      financial_years GET    /financial_years(.:format)       financial_years#index
#                      POST   /financial_years(.:format)       financial_years#create
#   new_financial_year GET    /financial_years/new(.:format)   financial_years#new
#    advertising_types GET    /advertising_types(.:format)     advertising_types#index
#                      POST   /advertising_types(.:format)     advertising_types#create
# new_advertising_type GET    /advertising_types/new(.:format) advertising_types#new
#       campaign_types GET    /campaign_types(.:format)        campaign_types#index
#                      POST   /campaign_types(.:format)        campaign_types#create
#    new_campaign_type GET    /campaign_types/new(.:format)    campaign_types#new
#          media_types GET    /media_types(.:format)           media_types#index
#                      POST   /media_types(.:format)           media_types#create
#       new_media_type GET    /media_types/new(.:format)       media_types#new
#          experiments GET    /experiments(.:format)           pages#experiments
#

Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users
  resources :users, only: [:show]

  resources :contracts,       only: [:index, :new, :create]
  
  resources :clients,         only: [:index, :new, :create]
  resources :engagements,     only: [:index, :new, :create]
  resources :vendors,         only: [:index, :new, :create]
  resources :financial_years, only: [:index, :new, :create]

  resources :advertising_types, only: [:index, :new, :create]
  resources :campaign_types,    only: [:index, :new, :create]
  resources :media_types,       only: [:index, :new, :create]

  get 'experiments' => 'pages#experiments'

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
