Rails.application.routes.draw do
  devise_for :admins, controllers: { 
      sessions: 'admin/sessions',
      registrations: 'admin/registrations',
      passwords: 'admin/passwords'
    }
    scope module: :public do
     resources :items do
      resource :favorites, only: [:create, :destroy]
     end
     resources :genres
     resources :orders, only:[:new,:create,:index]
     post '/orders/confirm' => 'orders#confirm', as: 'orders_confirm'
     get '/orders/complete' => 'orders#complete', as: 'orders_complete'
     resources :cart_items do
      delete 'destroy_all'#destroy_allアクションの追加するため
     end
     resource :end_user
     resources :addresses
     patch '/end_users/withdraw' => 'end_users#withdraw',as:'end_users_withdraw'
     get '/search', to: 'search#search'
  end
  devise_for :end_users, controllers: {
      sessions: 'public/sessions',
      registrations: 'public/registrations',
      passwords: 'public/passwords'
    }
     root to: 'public/items#top'
     get '/admin/top' => 'admin/items#top',as:'admin_items_top'

  namespace :admin do
   resources :end_users
   resources :items do
    resources :images, only: [:index, :create]
   end
   resources :genres
   resources :orders, only: [:index,:show,:update]
   resources :order_details,only: [:update]
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
