class ApplicationController < ActionController::Base
  # include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: ->{request.format.json?}
  wrap_parameters format: []
  before_action :configure_permitted_parameters, if: :devise_controller?
  # respond_to :json

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :username, :firstname, :lastname, :bio, :location, :birthday, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :username, :firstname, :lastname, :email, :bio, :location, :birthday, :password, :password_confirmation, :current_password])
  end

end
