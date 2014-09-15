class ReportsController < ApplicationController
  def show_report
    @test_run = TestRun.find(params[:test_run_id])
    if params[:status] == 'success'
      @reports = @test_run.reports.passed
    elsif params[:status] == 'failure'
      @reports = @test_run.reports.failure
    else
      #binding.pry
      @reports = @test_run.reports
    end
      @reports_page = @reports.page(params[:page]).per(10)
      @reports = @reports_page.group_by{ |t| t.pdf_name}
  end
end