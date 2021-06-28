# authentication helper
module AuthenticationHelper
  def authenticate_admin
    redirect_to root_path, notice: I18n.t('not_allow') unless current_user.admin?
  end

  def authenticate_user!
    redirect_to log_in_path, notice: I18n.t('authenticate_user') if current_user.nil?
  end
end
