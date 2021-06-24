module AuthenticationHelper
  def authenticate_admin
    unless current_user.admin?
      redirect_to root_path, notice: I18n.t('not_allow')
    end
  end

  def authenticate_user!
    if current_user.nil?
      redirect_to log_in_path, notice: I18n.t('authenticate_user')
    end
  end
end
