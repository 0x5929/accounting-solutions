class PagesController < ApplicationController
  def index
    # @application = Doorkeeper::Application.find_by(name: 'Web Client')

    # # for dev purpose only, so we can get the client_id and client_secret to be exported to an .env file for frontend
    # @application = {
    #   name: @application.name,
    #   client_id: @application.uid,
    #   client_secret: @application.secret
    # }
  end

  def about; end

  def services; end

  def contact; end

  def send_contact
    # pass in for validation
    @contact_msg = Message.new({ 
      email: params[:email], 
      subject: params[:subject], 
      message: params[:message] 
    })
    
    if @contact_msg.valid?
      ContactMailer.with(email: params[:email], subject: params[:subject], msg: params[:message])
                   .contact_email
                   .deliver_now
      redirect_to root_path
    else
      redirect_to contact_path
    end

  end
end
