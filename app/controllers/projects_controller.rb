class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @pagy, @conversation_items = pagy(@project.conversation_items.includes(:user), items: 10)
    @comment = Comment.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :status)
  end
end
