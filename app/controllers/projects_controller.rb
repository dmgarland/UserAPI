class ProjectsController < ApplicationController
  before_action :find_project, :only => [:show, :update, :destroy]

  def index
    @projects = Project.all.filter_by_user(params[:user_id])
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
    params.require(:project).permit("name", "description", "link", "imgUrl", "id", "userId" ).transform_keys { |k| k.underscore }
  end

  def find_project
    @project = Project.find(params[:id])
  end
end