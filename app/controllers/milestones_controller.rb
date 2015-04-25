class MilestonesController < ApplicationController


  def index
    @project = Project.find(params[:id])
    @milestones = @project.milestones
  end

  def new
    @project = Project.find(params[:id])
    @milestone = @project.milestones.new
  end

  def show
    @milestone = Milestone.find(params[:id])
    @project = @milestone.project
    
    @tasks = @milestone.tasks.where.not(completed: true)
    @task = Task.new
  end

  def create
    @project = Project.find(params[:id])
    @milestone = @project.milestones.new(milestone_params)

    @milestone.save
    redirect_to user_project_path(@project.user, @project)
  end

  def edit
    @milestone = Milestone.find(params[:id])
    @project = @milestone.project
  end

  def update
    @milestone = Milestone.find(params[:id])
    @project = @milestone.project

    if @milestone.update(milestone_params)
      redirect_to project_milestone_path(current_user, @project, @milestone)
    else
      render :new
    end
  end

  def destroy
    @milestone = Milestone.find(params[:id])
    @project = @milestone.project
    @user = @project.user
    @milestone.destroy

    redirect_to user_project_path(@user, @project)
  end

  private
  def milestone_params
    params.require(:milestone).permit(:name)
  end


end
