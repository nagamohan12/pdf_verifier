class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /projects
  # GET /projects.json
  def index
    #Use Datepicker and modify date params like following
    date_input = params[:q].delete(:last_test_run_run_at_cont)
    params[:q].merge!({ 
      last_test_run_run_at_gt: date_input.to_datetime, 
      last_test_run_run_at_lteq: date_input.to_datetime + 1 - 1.seconds 
      }) if !date_input.blank?
    @search = current_user.projects.includes(:last_test_run).search(params[:q])
    @projects = @search.result.order('name asc').page(params[:page]).per(10)
    # @test_runs = []
    # @projects = current_user.projects.each do |p|
    #   @test_runs << p.test_runs.last_run_at
    # end
    # @search = @test_runs.search(params[:q])
    # @projects = @search.result.order('name asc').page(params[:page]).per(10)

    # @projects = current_user.projects.each do |p|
    #   binding.pry
    #   test_run = p.test_runs.last_run_at
    #   p.association("test_runs").target = test_run
    # end
    # @search = @projects.includes(:test_runs).search(params[:q])
    # @projects = @search.result.order('name asc').page(params[:page]).per(10)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    # @search = @project.reports.search(params[:q])
    # @test_run_ids = @search.result.map{|report| report.test_run_id}.uniq
    # @test_runs = @project.test_runs.where(id: @test_run_ids).run_at_desc.page(params[:page]).per(10)
    @test_runs = @project.test_runs.run_at_desc.page(params[:page]).per(10)
  end

  # GET /projects/new
 

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.organization = current_user.organization
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
        format.js
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
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
      params.require(:project).permit(:organization_id, :name, :description, :input_folder, :pdf_folder, :run_frequency, :next_run, :active)
    end
end
