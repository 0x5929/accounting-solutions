class SiteController < ApplicationController
  def index
    @application = Doorkeeper::Application.find_by(name: 'Web Client')

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
