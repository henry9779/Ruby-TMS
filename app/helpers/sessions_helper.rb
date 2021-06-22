module SessionsHelper
  def current_user
    if session[:user5555].present?
      @user ||= User.find_by(email: session[:user5555])
    else
      nil
    end
  end

  def user_sign_in?
    current_user
  end

  def authenticate_user!
    if current_user.nil?
      redirect_to users_log_in_path, notice: I18n.t('authenticate_user')
    end
  end
end
