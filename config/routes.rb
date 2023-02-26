Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'site/index'
  get 'site/about'
  get 'site/services'
  get 'site/contact'
  resources :documents

  root 'site#index'

end
