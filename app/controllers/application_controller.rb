class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    unless current_user
      redirect_to root_url, flash: { warning: I18n.t('errors.authenticate') }
    end
  end
end
