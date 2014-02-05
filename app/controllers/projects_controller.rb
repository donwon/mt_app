class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

  @projects_recent = Project.order("updated_at DESC")

  recent_ids = []
  @projects_recent.each {|x| recent_ids << x.id }
  @projects_by_hits = Project.order_by_hits
  Rails.logger.info '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
  Rails.logger.info recent_ids

  @projects_left_over = @projects_by_hits.select { |x| !recent_ids.include?(x.id) }


  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @task = Task.new
    @discussion = @project.discussions
    @comment=Comment.new
    @project.hit_counter += 1
    @project.save
    
    Rails.logger.info ">>>>>>>>>>>>>>"
    Rails.logger.info @project.tasks
    Rails.logger.info @project.discussions
    # Rails.logger.info @discussion.comments
    
    #@task = Task.all
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    #@project = Project.new(project_params)
    @project = current_user.projects.new project_params
      if @project.save
        redirect_to @project, notice: 'Project was successfully created.' 
      else
        redirect_to @project, alert: "Sorry Something Went Wrong"
      end
 
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :client, :body, :status, :category, :hit_counter, :user_id)
    end
end
