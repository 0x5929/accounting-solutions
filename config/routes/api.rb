namespace :api do
    namespace :v1 do

        scope :users, module: :users do
            post '/', to: 'registration#create', as: :user_registration
        end

        resources :documents
    end
end

scope :api do
    scope :v1 do
        use_doorkeeper do
            skip_controllers :authorization, :application, :authorized_applications
        end
    end
end
