# Doorkeeper application
if Doorkeeper::Application.count.zero?
  Doorkeeper::Application.create!(name: 'Web Client', redirect_uri: '', scopes: '')
  # Doorkeeper::Application.create!(name: 'Mobile Client', redirect_uri: '', scopes: '')
end

if Rails.env.development?

  # User and AdminUser from devise
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

  # Document resource objects
  5.times do |i|
    Document.create!(
      user_id: User.all.first.id, 
      id: i, 
      file_name: "sample file name number #{i}", 
      file_location: "sample file location #{i}"
    )
  end
end
