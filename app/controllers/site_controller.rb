class SiteController < ApplicationController
  def index
    @application = Doorkeeper::Application.find_by(name: 'Web Client')

    # for dev purpose only, so we can get the client_id and client_secret to be exported to an .env file for frontend
    @application = {
      name: @application.name,
      client_id: @application.uid,
      client_secret: @application.secret
    }
  end

  def about
  end

  def services
  end

  def contact
  end
end
