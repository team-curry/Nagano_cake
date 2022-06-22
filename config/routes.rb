Rails.application.routes.draw do
  namespace :customers do

  get "/", to: "homes#top"

  resources:homes
  resources:customers
  resources:sweets
  resources:cart_items
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
