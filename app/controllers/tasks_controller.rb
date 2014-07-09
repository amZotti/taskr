class TasksController < ApplicationController
  before_action :require_login

  def index
    @task = Task.new
    @tasks = current_user.tasks.not_completed.order("created_at DESC")
    @completed_tasks = current_user.tasks.completed
  end

  def update
    @task = current_user.tasks.find(params[:id])
    @task.completed = true
    @task.save
    render nothing: true, status: 200

  end

  def create
    @task =  current_user.tasks.new(task_params)
    @tasks = current_user.tasks

    if @task.save
      render @task
    else
      render partial: "errors",
       locals: { target:  @task },
       status: 422
    end
  end
  private
  def task_params
    params.require("task").permit(:title,:body);
    #Require whatever the HTML action is
  end
end
