Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  } do
  get 'users/sign_out' => 'devise/sessions#destroy'
end
resources :orders do
  member do
    get 'orderdetail'
  end
end
resources :data_entries
resources :user_agrovets
resources :agrovets do
  resources :orders, only: [:index, :show, :new, :create]
  member do
    get 'agrovetinfo'
    get 'placeorder'
    get 'allorders'
    
  end
  get 'data_entries/new'
  get 'orders/new'
end
resources :products
# devise_for :users
root "pages#home"
get 'products/index'
get 'agrovets/index'
get 'admin', to: 'pages#admin', as: 'pages_admin'
get 'salesrep', to: 'pages#salesrep', as: 'pages_salesrep'
get 'manager', to: 'pages#manager', as: 'pages_manager'
get 'pendingorders', to: 'pages#pendingorders', as: 'pages_pendingorders'
get 'dispatchedorders', to: 'pages#dispatchedorders', as: 'pages_dispatchedorders'
get 'receivedorders', to: 'pages#receivedorders', as: 'pages_receivedorders'
get 'allsalesreps', to: 'pages#allsalesreps', as: 'pages_allsalesreps'
get 'allagrovets', to: 'pages#allagrovets', as: 'pages_allagrovets'
end
