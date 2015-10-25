Rails.application.routes.draw do
  devise_for :admins, :controllers => { :registrations => "admins/registrations" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # devise_scope :admin do
  #   root to: "devise/sessions#new"
  # end

  root "home#index"

  
  get 'forms/:id/service_check_list', to: 'forms#service_check_list'
  get 'forms/:id/account_shell_spanish', to: 'forms#account_shell_spanish'

  get 'forms/:id/account_shell', to: 'forms#account_shell'
  get 'forms/:id/update_info', to: 'forms#update_info'


  get 'forms/generate_bills', to: 'forms#generate_bills'

  # nested routes to allow /customers/:customer_id/addresses and /customers/:customer_id/insurances
  # allowed because address and insurance belong to customer
  resources :customers do
    collection { post :import }
    resources :addresses, :insurances, :systems
  end
  resources :system_types, :transponder_types do
    resources :systems
  end

  resources :caseworkers, :regions, :billing_intervals, :forms, :customer_imports

  # Customer controller routes

  # get 'customers/:id/destroy' => 'customers#destroy', :as => :customer_destroy  DON'T DO THIS. EXPOSES OUR DB WITH GET

  # Caseworkers controller routes

  get 'customers/:id/select' => 'customers#select', :as => :select_caseworker

  # Billing Interval controller routes

  post 'billing_intervals/select_billings', to: 'billing_intervals#select_billings'

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
