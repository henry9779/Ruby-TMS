# registrations_controller
class RegistrationsController < ApplicationController
  before_action :check_recaptcha_v2, only: [:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: I18n.t('user.created')
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def check_recaptcha_v2
    valid = verify_recaptcha secret_key: ENV['RECAPTCHA_V2_SECRET_KEY']

    if not valid
      redirect_to new_user_registration_path
    end
  end
end
