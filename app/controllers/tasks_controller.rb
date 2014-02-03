class TasksController < ApplicationController
before_action :authenticate_user!


def create
  
  task = Task.new params.require(:task).permit(:name,:due_date,:assignees,:completed,:body)
  #now we need to link project with tasks. 
  @project = Project.find(params[:project_id])
  task.project = @project
  if task.save
    redirect_to project_path(@project),  notice: "Save success"
  else
    redirect_to project_path(@project),  alert: "Error!"  
  end
end

  def destroy
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to @project, notice:"Task Deleted"
  end

  def edit
    task = Task.find(params[:id])
    Rails.logger.info(task.completed)
    @project = Project.find(params[:project_id])
    if task.completed 
      task.completed = false
      task.save
      redirect_to project_path(@project),  notice: "Updated Status to Incomplete"
    else
      task.completed = true
      task.save
      redirect_to project_path(@project),  notice: "Updated Status to Complete"
    end
  end




private 


end
