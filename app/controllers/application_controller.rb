class ApplicationController < ActionController::Base
  before_action :set_current_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_current_user
    @current_user ||= User.last
  end
end
