# session helper
module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def user_sign_in?
    !current_user.nil?
  end
end
