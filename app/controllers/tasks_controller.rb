class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)

    if @task.save
      redirect_to root_path, notice: 'Task Created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: 'Task Updated'
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to root_path, notice: 'Task Deleted'
    else
      render 'Record Not Found'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end

  def find_task
    @task = Task.find_by(id: params[:id])
  end
end
