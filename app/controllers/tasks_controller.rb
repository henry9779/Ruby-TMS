class TasksController < ApplicationController
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
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])

    if @task.update(task_params)
      redirect_to root_path, notice: 'Task Updated'
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])

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
end
