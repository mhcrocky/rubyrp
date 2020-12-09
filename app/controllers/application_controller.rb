class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  rescue_from ActionController::InvalidAuthenticityToken do |exception|
    respond_to do |format|
      format.html { redirect_to main_app.root_url, alert: 'Sorry, that request could not be processed.' }
      format.json { render json: { message: 'Sorry, that request could not be processed.' }, status: :unauthorized }
    end
  end

end
