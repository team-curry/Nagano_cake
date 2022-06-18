Rails.application.routes.draw do


  namespace :admins do

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
