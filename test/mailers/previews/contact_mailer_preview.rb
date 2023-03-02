# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_email
    email = 'test@email'
    subject = 'test subject'
    message = 'test message'

    ContactMailer.with(email:, subject:, msg: message).contact_email
  end
end
