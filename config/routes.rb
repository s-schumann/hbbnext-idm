HbbnextIdm::Application.routes.draw do

  get "welcome/index"

  get 'admin', to: 'admin#index',    as: 'admin'
  get "admin/index"

  get 'signup', to: 'consumers#new',    as: 'signup'
  get 'login',  to: 'sessions#new',     as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions

  resources :consumers

  resources :swagger

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :users
      resources :devices
      resources :contexts
      get 'resources/resources', to: 'resources#index', as: 'resources'
      get 'resources', to: 'resources#index', as: 'resources'
      get 'resources/users', to: 'resources/users#index', as: 'resources/users'
      get 'resources/devices', to: 'resources/devices#index', as: 'resources/devices'
      get 'resources/contexts', to: 'resources/contexts#index', as: 'resources/contexts'
    end
    namespace :v2 do
      resources :users
      resources :devices
      resources :contexts
      get 'resources/resources', to: 'resources#index', as: 'resources'
      get 'resources', to: 'resources#index', as: 'resources'
      get 'resources/users', to: 'resources/users#index', as: 'resources/users'
      get 'resources/devices', to: 'resources/devices#index', as: 'resources/devices'
      get 'resources/contexts', to: 'resources/contexts#index', as: 'resources/contexts'
      resources :contexts do
        namespace :active do
          resources :users, only: [:index, :create, :show, :update, :destroy]
          resources :devices, only: [:index, :create, :show, :update, :destroy]
          resources :udrs, only: [:index, :create, :show, :update, :destroy]
        end
        get 'active'
      end
    end
    namespace :v3 do
      resources :users
      resources :devices
      resources :contexts
      get 'resources/resources', to: 'resources#index', as: 'resources'
      get 'resources', to: 'resources#index', as: 'resources'
      get 'resources/users', to: 'resources/users#index', as: 'resources/users'
      get 'resources/devices', to: 'resources/devices#index', as: 'resources/devices'
      get 'resources/contexts', to: 'resources/contexts#index', as: 'resources/contexts'
      resources :contexts do
        namespace :active do
          resources :users, only: [:index, :create, :show, :update, :destroy]
          resources :devices, only: [:index, :create, :show, :update, :destroy]
          resources :udrs, only: [:index, :create, :show, :update, :destroy]
        end
        get 'active'
      end
    end
  end

  resources :users

  resources :devices

  resources :contexts

  resources :contexts do
    namespace :active do
      resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :devices, only: [:index, :create, :show, :update, :destroy]
      resources :udrs, only: [:index, :create, :show, :update, :destroy]
    end
    get 'active'
  end

  get 'wiki', to: 'wiki#index',    as: 'wiki'
  get "wiki/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
