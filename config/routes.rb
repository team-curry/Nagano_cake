Rails.application.routes.draw do
  namespace :customers do

  get "/", to: "homes#top"
  get "/about", to: "homes#about"
  
  get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  
  resources:customers 
  resources:sweets
  resource:cart_items do
    collection do
      delete 'destroy_all'
    end
  end
  resources:orders do
     collection do
      get 'complete'
     end
     collection do
      post 'confirm'
     end
  end
  resources:addresses

 end

  namespace :admins do

  root to: "homes#top"
  get "/", to: "homes#top"

  resources:homes, only: [:top, :about]
  resources:customers
  resources:sweets
  resources:orders
  resources:order_details
  resources:genres

  patch '/orders/:id/status' => 'orders#status_update', as: "status" # 受注ステータス
  patch '/orders/:id/making_status' => 'orders#making_status_update', as: "making_status" # 製作ステータス
  end
  # devise_for :customers
  # devise_for :admins
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions:      'admins/sessions'
}
devise_for :customers, skip: [:passwords] ,controllers: {
  registrations: 'customers/registrations',
  sessions:      'customers/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
