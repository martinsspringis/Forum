Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  resources :articles do
    resources :replies
  end
  resources :users do
    member do
      put "block"
      put "unblock"
    end
  end
  resource :administrations do
    member do
      get "send_summary"
    end
  end
  resource :home
  
  
  #get send_summary, to: 'administrations_controller#send_summary', as: :send_summary
  root 'home#index'

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

# == Route Map
#
#                   Prefix Verb   URI Pattern                                      Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                         devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                         devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                        devise/sessions#destroy
#            user_password POST   /users/password(.:format)                        devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                    devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                   devise/passwords#edit
#                          PATCH  /users/password(.:format)                        devise/passwords#update
#                          PUT    /users/password(.:format)                        devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                          devise/registrations#cancel
#        user_registration POST   /users(.:format)                                 devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                         devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                            devise/registrations#edit
#                          PATCH  /users(.:format)                                 devise/registrations#update
#                          PUT    /users(.:format)                                 devise/registrations#update
#                          DELETE /users(.:format)                                 devise/registrations#destroy
#        user_confirmation POST   /users/confirmation(.:format)                    devise/confirmations#create
#    new_user_confirmation GET    /users/confirmation/new(.:format)                devise/confirmations#new
#                          GET    /users/confirmation(.:format)                    devise/confirmations#show
#          article_replies GET    /articles/:article_id/replies(.:format)          replies#index
#                          POST   /articles/:article_id/replies(.:format)          replies#create
#        new_article_reply GET    /articles/:article_id/replies/new(.:format)      replies#new
#       edit_article_reply GET    /articles/:article_id/replies/:id/edit(.:format) replies#edit
#            article_reply GET    /articles/:article_id/replies/:id(.:format)      replies#show
#                          PATCH  /articles/:article_id/replies/:id(.:format)      replies#update
#                          PUT    /articles/:article_id/replies/:id(.:format)      replies#update
#                          DELETE /articles/:article_id/replies/:id(.:format)      replies#destroy
#                 articles GET    /articles(.:format)                              articles#index
#                          POST   /articles(.:format)                              articles#create
#              new_article GET    /articles/new(.:format)                          articles#new
#             edit_article GET    /articles/:id/edit(.:format)                     articles#edit
#                  article GET    /articles/:id(.:format)                          articles#show
#                          PATCH  /articles/:id(.:format)                          articles#update
#                          PUT    /articles/:id(.:format)                          articles#update
#                          DELETE /articles/:id(.:format)                          articles#destroy
#                    users GET    /users(.:format)                                 users#index
#                          POST   /users(.:format)                                 users#create
#                 new_user GET    /users/new(.:format)                             users#new
#                edit_user GET    /users/:id/edit(.:format)                        users#edit
#                     user GET    /users/:id(.:format)                             users#show
#                          PATCH  /users/:id(.:format)                             users#update
#                          PUT    /users/:id(.:format)                             users#update
#                          DELETE /users/:id(.:format)                             users#destroy
#                     root GET    /                                                articles#index
#
