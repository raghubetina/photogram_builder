class ApplicationController < ActionController::Base
  include Graphiti::Rails

  before_action :authenticate_user!

  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  register_exception Graphiti::Errors::RecordNotFound, status: 404

  rescue_from Exception do |e|
    handle_exception(e)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:username])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:username])
  end
end
