class DiscussionsController < ApplicationController

def new
   @project = Project.find(params[:project_id])
   @discussion = Discussion.new
end

def create
  #this is called with form for Post.
  discussion = Discussion.new params.require(:discussion).permit(:topic, :title, :body, :user_id)
  #now we need to link project with tasks. 
  @project = Project.find(params[:project_id])
  discussion.project = @project
  discussion.user = current_user
  if discussion.save
    redirect_to project_path(@project),  notice: "Save success"
  else
    redirect_to project_path(@project),  alert: "Error!"  
  end
end

  def destroy
    @project = Project.find(params[:project_id])
    @discussion = Discussion.find(params[:id])

    if @discussion.user == current_user
      @discussion.destroy 
      redirect_to @project, notice:"Task Deleted"
    else
      redirect_to @project, alert:"You must be the originator of the discussion topic to delete."
    end
  end

  def edit
    discussion = Discussion.find(params[:id])
    Rails.logger.info(discussion)
    @project = Project.find(params[:project_id])
  end

end
