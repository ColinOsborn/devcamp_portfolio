class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_santizer.permit(:sign_up, keys: [:name])
    devise_parameter_santizer.permit(:account_update, keys: [:name])
  end
end
