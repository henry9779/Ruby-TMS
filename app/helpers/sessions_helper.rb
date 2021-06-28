# session helper
module SessionsHelper
  def current_user
    @user ||= User.find_by(email: session[:user5555]) if session[:user5555].present?
  end

  def user_sign_in?
    !current_user.nil?
  end
end
