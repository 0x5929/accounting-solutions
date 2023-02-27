Rails.application.routes.draw do
  root 'site#index'
  
  use_doorkeeper
  resources :documents
  devise_for :users

  # devise_scope :user do
  #   get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
  #   delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  #   # etc...
  # end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'site/index'
  get 'site/about'
  get 'site/services'
  get 'site/contact'

  draw :api

end
