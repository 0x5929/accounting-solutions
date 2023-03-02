Rails.application.routes.draw do
  # root
  root 'pages#index'
  
  # site urls
  get 'index', to: 'pages#index'
  get 'about', to: 'pages#about'
  get 'services', to: 'pages#services'
  get 'contact', to: 'pages#contact'
  post 'send_contact', to: 'pages#send_contact'

  # gem created urls
  devise_for :users, skip: :all
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  use_doorkeeper

  # api urls
  namespace :api do
    namespace :v1 do
      resources :documents
    end
  end

  # doorkeeper paths (gem)
  scope :api do
    scope :v1 do
      use_doorkeeper do
        skip_controllers :authorization, :application, :authorized_applications
      end
    end
  end
end
