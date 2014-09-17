class ReportsController < ApplicationController
  def index
    @test_run = TestRun.find(params[:test_run_id])
    @search = Report.search(params[:q])
    @reports = @search.result.where(test_run_id: @test_run.id)
    if params[:status] == 'success'
      @reports = @reports.passed
    elsif params[:status] == 'failure'
      @reports = @reports.failure
    end
      @reports_page = @reports.page(params[:page]).per(10)
      @reports = @reports_page.group_by{ |t| t.pdf_name}
  end

  def show_report
    # @test_run = TestRun.find(params[:test_run_id])
    # if params[:status] == 'success'
    #   @reports = @test_run.reports.passed
    # elsif params[:status] == 'failure'
    #   @reports = @test_run.reports.failure
    # else
    #   @reports = @test_run.reports
    # end
    #   @reports_page = @reports.page(params[:page]).per(10)
    #   @reports = @reports_page.group_by{ |t| t.pdf_name}
  end
end