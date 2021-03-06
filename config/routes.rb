Btfdtv::Application.routes.draw do

  get 'home' => 'home#index', as: "home"

  resources :attachments
  get 'streams/:id/attachments' => 'streams#attachments', as: 'stream_attachments'
  get 'streams/BTFDtv/direct/:direct' => 'streams#index', as: 'stream_direct'
  post 'streams/:id/videos/:slug/tags' => 'streams#create_video_tag', as: 'stream_video_tags'
  get 'streams/:id/videos/:slug/tags' => 'streams#list_video_tags', as: 'list_stream_video_tags'
  delete 'streams/:id/videos/:slug/tags/:tag' => 'streams#delete_video_tag', as: 'delete_stream_video_tag'
  
  get 'announcements/:id/hide' =>  'announcements#hide', as: 'hide_announcement'
  resources :announcements

  get "faqs/index"  
  resources :faqs
  
  get "editorials/index"  
  resources :editorials

  get "schedules/index"
  resources :schedules 
  resources :disclaimers

  #sorcery authentication
  get "logout" => "sessions#destroy", :as => "logout"
  get "login"  => "sessions#new",     :as => "login"
  get "signup" => "users#new",        :as => "signup"
  resources :users
  resources :sessions
  #end sorcery authentication

  # individuals who are hosts, guests or bloggers
  resources :contributors

  # resources for streaming content
  resources :streams do
    resources :videos
  end 
  

  # stuff that BTFDtv sells for making money
  resources :products

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  get '/:direct' => 'streams#index', as: 'tiny_stream_direct'

  #root 'streams#index'

  root 'home#index'

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
