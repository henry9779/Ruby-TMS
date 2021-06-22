# admin_controller
class Admin::UsersController < ApplicationController
  before_action :find_user, only: %i[edit update destroy]

  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result.page(params[:page]).per(7)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: I18n.t('user.created')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update!(user_params)
      redirect_to admin_users_path, notice: I18n.t('user.updated')
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: I18n.t('user.deleted')
    else
      render status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
