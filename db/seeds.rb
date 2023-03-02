# Doorkeeper application
if Doorkeeper::Application.count.zero?
  Doorkeeper::Application.create!(name: 'Web Client', redirect_uri: '', scopes: '')
  # Doorkeeper::Application.create!(name: 'Mobile Client', redirect_uri: '', scopes: '')
end

# User and AdminUser from devise
if Rails.env.development?
  User.first_or_create(
    email: 'test@email.com', 
    password: 'password', 
    password_confirmation: 'password'
  ) 
  AdminUser.first_or_create(
    email: 'root@localhost', 
    password: 'password', 
    password_confirmation: 'password'
  ) 
end

# Document resource objects