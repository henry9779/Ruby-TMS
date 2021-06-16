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
end
