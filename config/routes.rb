Rails.application.routes.draw do
  get 'site/index'
  get 'site/about'
  get 'site/services'
  get 'site/contact'
  resources :documents

  root 'site#index'

end
