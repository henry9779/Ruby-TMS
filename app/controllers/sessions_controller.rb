# sessions_controller
class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    session[:user5555] = params[:user][:email]
    if User.login(params[:user])
      redirect_to root_path, notice: I18n.t('session.created')
    else
      redirect_to log_in_path, notice: I18n.t('session.failed')
    end
  end

  def destroy
    session[:user5555] = nil
    redirect_to root_path, notice: I18n.t('session.deleted')
  end
end
