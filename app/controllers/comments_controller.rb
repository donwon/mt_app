class CommentsController < ApplicationController
before_action :authenticate_user!
before_action :find_commentable

def create
# @project = Project.find(params[:project_id])  
@comment = @commentable.comments.new params.require(:comment).permit(:body)
@comment.user = current_user
#@comment.discussion = Discussion.find(params[:discussion_id])
  if @comment.save
    redirect_to commentable_redirect_path, notice: "Thanks for commenting on this"
  else
    redirect_to commentable_redirect_path, alert: "Sorry, comment did not save"
  end
end

# def create_old
# @project = Project.find(params[:project_id])  
# @comment = Comment.new params.require(:comment).permit(:body)
# @comment.discussion = Discussion.find(params[:discussion_id])
# @comment.user = current_user
# @comment.save
# redirect_to @project, notice: "Thanks for your comment"
# end

def destroy
  if @commentable.comments.delete(Comment.find params[:id])
    redirect_to commentable_redirect_path, notice: "Comment Deleted"
  else
    redirect_to commentable_redirect_path, alert: "Sorry, comment did not delete"
  end
end

# def destroy_old
#   @project = Project.find(params[:project_id])  
#   @comment = Comment.find(params[:id])
#   @comment.discussion = Discussion.find(params[:discussion_id])
#   if @comment.user == current_user
#     @comment.destroy
#     redirect_to @project, notice: "comment has been deleted"
#   else 
#     redirect_to @project, alert: "you must be originator to delete comment"
#   end
# end

private
  
  def find_commentable
  @commentable = if params.has_key? :discussion_id
                    Discussion.find(params[:discussion_id])
                  elsif params.has_key? :project_id
                    Project.find(params[:project_id])
                  end
  end

  # def find_commentable
  #   klass     = [Discussion, Project].detect { |c| params["#{c.name.underscore}_id"] }
  #   @commentable = klass.find(params["#{klass.name.underscore}_id"])
  # end

  def resource_name
    @commentable.class.name.downcase
  end

  def commentable_redirect_path
    case @commentable
    when Discussion then @commentable.project
    when Project   then @commentable
    end
  end

end
