# tasks_controller
class TasksController < ApplicationController
  before_action :find_task, only: %i[edit update destroy]

  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true).page(params[:page]).per(7)
  end

  def new
    @task = Task.new
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
    params.require(:task).permit(:title, :content, :end_at, :status, :priority)
  end

  def find_task
    @task = Task.find_by(id: params[:id])
  end
end
