class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:native_currency])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:native_currency])
  end
end
