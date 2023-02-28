Rails.application.routes.draw do
  # root
  root 'pages#index'
  
  # gem created urls
  use_doorkeeper
  devise_for :users, skip: :registrations
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # rails created urls
  resources :documents
  
  # site urls
  get 'index', to: 'pages#index'
  get 'about', to: 'pages#about'
  get 'services', to: 'pages#services'
  get 'contact', to: 'pages#contact'

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
