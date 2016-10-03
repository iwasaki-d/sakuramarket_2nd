Rails.application.routes.draw do

  resource :cart, only: %i(show edit update) do
    member do
      get :calculate
      get :order
    end
  end
  resource :user, only: %i(show edit update)

  devise_for :users

  resources :commodities, only: %i(show)
  resources :cart_commodities, only: %i(create delete)

  namespace :admin do
    resources :users, except: %i(new create)
    resources :commodities
  end

  root to: "home#index"
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
