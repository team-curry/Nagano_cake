Rails.application.routes.draw do
  namespace :customers do
    
  get "/", to: "homes#top"

  resources:homes
  resources:customers
  resources:sweets
  resources:cart_items
  resources:orders
  resources:addresses

 end

  namespace :admins do
    
  get "/", to: "homes#top"

  resources:homes, only: [:top, :about]
  resources:customers, only: [:index, :show, :edit, :update]
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
