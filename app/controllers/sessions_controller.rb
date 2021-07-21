# sessions_controller
class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.login(params[:user])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: I18n.t('session.created')
    else
      redirect_to log_in_path, notice: I18n.t('session.failed')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: I18n.t('session.deleted')
  end
end
