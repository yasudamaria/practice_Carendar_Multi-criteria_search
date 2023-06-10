class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
  end
  def after_sign_up_path_for(resource)
    hallo_link_path
  end

  def after_sign_in_path_for(resource)
    calendar_path
  end

  def after_update_path_for(resource)
    user_path
  end
end
