class CommentsController < ApplicationController

def create
@project = Project.find(params[:project_id])  
@comment = Comment.new params.require(:comment).permit(:body)
@comment.discussion = Discussion.find(params[:discussion_id])
@comment.user = current_user

@comment.save
redirect_to @project, notice: "Thanks for your comment"

end


def destroy
  @project = Project.find(params[:project_id])  
  @comment = Comment.find(params[:id])
  @comment.discussion = Discussion.find(params[:discussion_id])
  if @comment.user == current_user
    @comment.destroy
    redirect_to @project, notice: "comment has been deleted"
  else 
    redirect_to @project, alert: "you must be originator to delete comment"
  end


end



end
