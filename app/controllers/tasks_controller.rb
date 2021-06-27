# tasks_controller
class TasksController < ApplicationController
  before_action :find_task, only: %i[edit update destroy]
  before_action :authenticate_user!

  def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).page(params[:page])
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to root_path, notice: I18n.t('task.created')
    else
      render :new
    end
  end

  def edit; end
  # TODO: if not current_user.task 404

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: I18n.t('task.updated')
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to root_path, notice: I18n.t('task.deleted')
    else
      render status: 404
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :end_at, :status, :priority, :all_tags)
  end

  def find_task
    @task = current_user.tasks.find_by(id: params[:id])
  end
end
