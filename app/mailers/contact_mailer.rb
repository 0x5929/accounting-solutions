class ContactMailer < ApplicationMailer
  default from: 'first.object.oriented@gmail.com'
  default to: 'first.object.oriented@gmail.com'
  def contact_email
    @customer_email = params[:email]
    @msg = params[:message]
    @subject = params[:subject]

    mail(subject: "You've got mail. From #{@customer_email}")
  end
end
