class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @project, notice: "Comment was successfully added."
    else
      redirect_to @project, alert: "Error adding comment."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
