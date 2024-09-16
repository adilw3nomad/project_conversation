class StatusChangesController < ApplicationController
  def create
    @project = Project.find(params[:project_id])

    if @project.update_status(status_change_params[:new_status], current_user)
      redirect_to @project, notice: "Project status was successfully updated."
    else
      redirect_to @project, alert: "Error updating project status."
    end
  end

  private

  def status_change_params
    params.require(:status_change).permit(:new_status)
  end
end
