class ProjectsController < ApplicationController

  def index
    @user = User.find(params[:id])
    @projects = @user.projects
  end

  def new
    @user = User.find(params[:id])
    @project = @user.projects.new
  end

  def show
    @project = Project.find(params[:id])
    @user = @project.user

    @milestones = @project.milestones
    @milestone = Milestone.new
  end

  def create
    @user = User.find(params[:id])
    @project = @user.projects.new(project_params)

    @project.save
    redirect_to user_projects_path(@user)
  end

  def edit
    @project = Project.find(params[:id])
    @user = @project.user
  end 

  def update
    @project = Project.find(params[:id])
    @user = @project.user

    if @project.update(project_params)
      redirect_to user_project_path(@user, @project)
    else
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to user_projects_path(@project.user)
  end


  private
  def project_params
    params.require(:project).permit(:name)
  end

end
