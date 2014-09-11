class ReportsController < ApplicationController
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