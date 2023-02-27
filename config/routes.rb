Rails.application.routes.draw do
  # root
  root 'site#index'
  
  # gem created urls
  use_doorkeeper
  devise_for :users, skip: :registrations
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # rails created urls
  resources :documents
  
  # site urls
  get 'index', to: 'site#index'
  get 'about', to: 'site#about'
  get 'services', to: 'site#services'
  get 'contact', to: 'site#contact'

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
