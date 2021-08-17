module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_santizer.permit(:sign_up, keys: [:name])
    devise_parameter_santizer.permit(:account_update, keys: [:name])
  end
end
