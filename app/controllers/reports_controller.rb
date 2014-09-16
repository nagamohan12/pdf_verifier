class ReportsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @search = @project.reports.search(params[:q])
    @test_run_ids = @search.result.map{|report| report.test_run_id}.uniq
    @test_runs = @project.test_runs.where(id: @test_run_ids).run_at_desc.page(params[:page]).per(10)
  end

  def show_report
    @test_run = TestRun.find(params[:test_run_id])
    if params[:status] == 'success'
      @reports = @test_run.reports.passed
    elsif params[:status] == 'failure'
      @reports = @test_run.reports.failure
    else
      @reports = @test_run.reports
    end
      
  end
end