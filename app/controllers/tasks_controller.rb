class TasksController < ApplicationController
  before_action :all_tasks, only: [:index, :create, :update]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # index and show actions removed
  def update
     @task.update(task_params) 
  end
  
  def new
    @task = Task.new
  end

  def create
    #@task = Task.new(task_params)
    @task  = Task.create(task_params)
  end

  private

    # new action
    def all_tasks
      @tasks = Task.all
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :deadline)
    end
end
