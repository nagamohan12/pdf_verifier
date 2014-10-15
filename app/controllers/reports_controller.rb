class ReportsController < ApplicationController
  layout false
  def index
    @test_run = TestRun.find(params[:test_run_id])
    @search = Report.search(params[:q])
    @reports = @search.result.where(test_run_id: @test_run.id)
    if params[:status] == 'success'
      @reports = @reports.passed
    elsif params[:status] == 'failure'
      @reports = @reports.failure
    end
      @reports_page = @reports.group(:pdf_name).select('pdf_name, count(*) as count, sum(is_passed) as passed').order(:pdf_name).page(params[:page]).per(3)
      @reports = @reports.group_by{ |t| t.pdf_name}
  end
end