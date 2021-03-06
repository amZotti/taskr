class TasksController < ApplicationController
  before_action :require_login

  def index
    @task = Task.new
    @tasks = current_user.tasks
  end

  def update
    @task = current_user.tasks.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to :tasks
  end

  def create
    @task =  current_user.tasks.new(task_params)
    @tasks = current_user.tasks

    if @task.save 
      redirect_to :tasks
    else
      render :index
    end
  end
  private
  def task_params
    params.require("task").permit(:title,:body);
    #Require whatever the HTML action is
  end
end
