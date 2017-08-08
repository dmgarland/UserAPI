class ProjectsController < ApplicationController
  before_action :find_user, :only => [:show, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    render json: @project
  end

  def update
    @project.update(project_params)
    render json: @project
  end

  def destroy
    @project.destroy
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :link, :img_url)
  end

  def find_user
    @project = Project.find(params[:id])
  end
end