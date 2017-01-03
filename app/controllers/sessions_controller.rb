class SessionsController < ApplicationController
  layout 'auth'
  
  def new
  end

  def create
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: I18n.t('user.auth_success')
    else
      flash.now.alert = I18n.t('user.auth_error')
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: I18n.t('user.sign_out_success')
  end
end
