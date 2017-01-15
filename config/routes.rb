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
      get "pending"
    end
  end
  resource :home
  resources :stats
  resources :news_articles
  resources :galleries
  resources :teams
  resources :games do
    resources :boxscores
    resources :player_stats
    member do
      put "reviewed"
    end
  end
  resources :players
  
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
#                           Prefix Verb     URI Pattern                                      Controller#Action
#                 new_user_session GET      /users/sign_in(.:format)                         devise/sessions#new
#                     user_session POST     /users/sign_in(.:format)                         devise/sessions#create
#             destroy_user_session DELETE   /users/sign_out(.:format)                        devise/sessions#destroy
# user_facebook_omniauth_authorize GET|POST /users/auth/facebook(.:format)                   users/omniauth_callbacks#passthru
#  user_facebook_omniauth_callback GET|POST /users/auth/facebook/callback(.:format)          users/omniauth_callbacks#facebook
#  user_twitter_omniauth_authorize GET|POST /users/auth/twitter(.:format)                    users/omniauth_callbacks#passthru
#   user_twitter_omniauth_callback GET|POST /users/auth/twitter/callback(.:format)           users/omniauth_callbacks#twitter
#                    user_password POST     /users/password(.:format)                        devise/passwords#create
#                new_user_password GET      /users/password/new(.:format)                    devise/passwords#new
#               edit_user_password GET      /users/password/edit(.:format)                   devise/passwords#edit
#                                  PATCH    /users/password(.:format)                        devise/passwords#update
#                                  PUT      /users/password(.:format)                        devise/passwords#update
#         cancel_user_registration GET      /users/cancel(.:format)                          devise/registrations#cancel
#                user_registration POST     /users(.:format)                                 devise/registrations#create
#            new_user_registration GET      /users/sign_up(.:format)                         devise/registrations#new
#           edit_user_registration GET      /users/edit(.:format)                            devise/registrations#edit
#                                  PATCH    /users(.:format)                                 devise/registrations#update
#                                  PUT      /users(.:format)                                 devise/registrations#update
#                                  DELETE   /users(.:format)                                 devise/registrations#destroy
#                user_confirmation POST     /users/confirmation(.:format)                    devise/confirmations#create
#            new_user_confirmation GET      /users/confirmation/new(.:format)                devise/confirmations#new
#                                  GET      /users/confirmation(.:format)                    devise/confirmations#show
#                  article_replies GET      /articles/:article_id/replies(.:format)          replies#index
#                                  POST     /articles/:article_id/replies(.:format)          replies#create
#                new_article_reply GET      /articles/:article_id/replies/new(.:format)      replies#new
#               edit_article_reply GET      /articles/:article_id/replies/:id/edit(.:format) replies#edit
#                    article_reply GET      /articles/:article_id/replies/:id(.:format)      replies#show
#                                  PATCH    /articles/:article_id/replies/:id(.:format)      replies#update
#                                  PUT      /articles/:article_id/replies/:id(.:format)      replies#update
#                                  DELETE   /articles/:article_id/replies/:id(.:format)      replies#destroy
#                         articles GET      /articles(.:format)                              articles#index
#                                  POST     /articles(.:format)                              articles#create
#                      new_article GET      /articles/new(.:format)                          articles#new
#                     edit_article GET      /articles/:id/edit(.:format)                     articles#edit
#                          article GET      /articles/:id(.:format)                          articles#show
#                                  PATCH    /articles/:id(.:format)                          articles#update
#                                  PUT      /articles/:id(.:format)                          articles#update
#                                  DELETE   /articles/:id(.:format)                          articles#destroy
#                       block_user PUT      /users/:id/block(.:format)                       users#block
#                     unblock_user PUT      /users/:id/unblock(.:format)                     users#unblock
#                            users GET      /users(.:format)                                 users#index
#                                  POST     /users(.:format)                                 users#create
#                         new_user GET      /users/new(.:format)                             users#new
#                        edit_user GET      /users/:id/edit(.:format)                        users#edit
#                             user GET      /users/:id(.:format)                             users#show
#                                  PATCH    /users/:id(.:format)                             users#update
#                                  PUT      /users/:id(.:format)                             users#update
#                                  DELETE   /users/:id(.:format)                             users#destroy
#     send_summary_administrations GET      /administrations/send_summary(.:format)          administrations#send_summary
#                  administrations POST     /administrations(.:format)                       administrations#create
#              new_administrations GET      /administrations/new(.:format)                   administrations#new
#             edit_administrations GET      /administrations/edit(.:format)                  administrations#edit
#                                  GET      /administrations(.:format)                       administrations#show
#                                  PATCH    /administrations(.:format)                       administrations#update
#                                  PUT      /administrations(.:format)                       administrations#update
#                                  DELETE   /administrations(.:format)                       administrations#destroy
#                             home POST     /home(.:format)                                  homes#create
#                         new_home GET      /home/new(.:format)                              homes#new
#                        edit_home GET      /home/edit(.:format)                             homes#edit
#                                  GET      /home(.:format)                                  homes#show
#                                  PATCH    /home(.:format)                                  homes#update
#                                  PUT      /home(.:format)                                  homes#update
#                                  DELETE   /home(.:format)                                  homes#destroy
#                        boxscores GET      /boxscores(.:format)                             boxscores#index
#                                  POST     /boxscores(.:format)                             boxscores#create
#                     new_boxscore GET      /boxscores/new(.:format)                         boxscores#new
#                    edit_boxscore GET      /boxscores/:id/edit(.:format)                    boxscores#edit
#                         boxscore GET      /boxscores/:id(.:format)                         boxscores#show
#                                  PATCH    /boxscores/:id(.:format)                         boxscores#update
#                                  PUT      /boxscores/:id(.:format)                         boxscores#update
#                                  DELETE   /boxscores/:id(.:format)                         boxscores#destroy
#                            stats GET      /stats(.:format)                                 stats#index
#                                  POST     /stats(.:format)                                 stats#create
#                         new_stat GET      /stats/new(.:format)                             stats#new
#                        edit_stat GET      /stats/:id/edit(.:format)                        stats#edit
#                             stat GET      /stats/:id(.:format)                             stats#show
#                                  PATCH    /stats/:id(.:format)                             stats#update
#                                  PUT      /stats/:id(.:format)                             stats#update
#                                  DELETE   /stats/:id(.:format)                             stats#destroy
#                    news_articles GET      /news_articles(.:format)                         news_articles#index
#                                  POST     /news_articles(.:format)                         news_articles#create
#                 new_news_article GET      /news_articles/new(.:format)                     news_articles#new
#                edit_news_article GET      /news_articles/:id/edit(.:format)                news_articles#edit
#                     news_article GET      /news_articles/:id(.:format)                     news_articles#show
#                                  PATCH    /news_articles/:id(.:format)                     news_articles#update
#                                  PUT      /news_articles/:id(.:format)                     news_articles#update
#                                  DELETE   /news_articles/:id(.:format)                     news_articles#destroy
#                        galleries GET      /galleries(.:format)                             galleries#index
#                                  POST     /galleries(.:format)                             galleries#create
#                      new_gallery GET      /galleries/new(.:format)                         galleries#new
#                     edit_gallery GET      /galleries/:id/edit(.:format)                    galleries#edit
#                          gallery GET      /galleries/:id(.:format)                         galleries#show
#                                  PATCH    /galleries/:id(.:format)                         galleries#update
#                                  PUT      /galleries/:id(.:format)                         galleries#update
#                                  DELETE   /galleries/:id(.:format)                         galleries#destroy
#                            teams GET      /teams(.:format)                                 teams#index
#                                  POST     /teams(.:format)                                 teams#create
#                         new_team GET      /teams/new(.:format)                             teams#new
#                        edit_team GET      /teams/:id/edit(.:format)                        teams#edit
#                             team GET      /teams/:id(.:format)                             teams#show
#                                  PATCH    /teams/:id(.:format)                             teams#update
#                                  PUT      /teams/:id(.:format)                             teams#update
#                                  DELETE   /teams/:id(.:format)                             teams#destroy
#                            games GET      /games(.:format)                                 games#index
#                                  POST     /games(.:format)                                 games#create
#                         new_game GET      /games/new(.:format)                             games#new
#                        edit_game GET      /games/:id/edit(.:format)                        games#edit
#                             game GET      /games/:id(.:format)                             games#show
#                                  PATCH    /games/:id(.:format)                             games#update
#                                  PUT      /games/:id(.:format)                             games#update
#                                  DELETE   /games/:id(.:format)                             games#destroy
#                     player_stats GET      /player_stats(.:format)                          player_stats#index
#                                  POST     /player_stats(.:format)                          player_stats#create
#                  new_player_stat GET      /player_stats/new(.:format)                      player_stats#new
#                 edit_player_stat GET      /player_stats/:id/edit(.:format)                 player_stats#edit
#                      player_stat GET      /player_stats/:id(.:format)                      player_stats#show
#                                  PATCH    /player_stats/:id(.:format)                      player_stats#update
#                                  PUT      /player_stats/:id(.:format)                      player_stats#update
#                                  DELETE   /player_stats/:id(.:format)                      player_stats#destroy
#                          players GET      /players(.:format)                               players#index
#                                  POST     /players(.:format)                               players#create
#                       new_player GET      /players/new(.:format)                           players#new
#                      edit_player GET      /players/:id/edit(.:format)                      players#edit
#                           player GET      /players/:id(.:format)                           players#show
#                                  PATCH    /players/:id(.:format)                           players#update
#                                  PUT      /players/:id(.:format)                           players#update
#                                  DELETE   /players/:id(.:format)                           players#destroy
#                             root GET      /                                                home#index
#
