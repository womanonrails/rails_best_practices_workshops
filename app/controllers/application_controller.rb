class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def configure_permitted_parameters
    sign_up_sanitizer << :name
    account_update_sanitizer << :name
  end

  def sign_up_sanitizer
    @sign_up_sanitizer ||= devise_parameter_sanitizer.for(:sign_up)
  end

  def account_update_sanitizer
    @account_update_sanitizer ||= devise_parameter_sanitizer.for(:account_update)
  end
end
