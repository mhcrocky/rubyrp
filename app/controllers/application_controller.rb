class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  rescue_from ActionController::InvalidAuthenticityToken do |exception|
    respond_to do |format|
      format.html { redirect_to main_app.root_url, alert: 'Sorry, that request could not be processed.' }
      format.json { render json: { message: 'Sorry, that request could not be processed.' }, status: :unauthorized }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :timezone, :dark_theme)
    end
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :password, :remember_me)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :current_password, :timezone, :dark_theme)
    end
  end

end
