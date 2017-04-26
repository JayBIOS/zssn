class ReportService
  def initialize(params)
    @infected = Survivor.find(params[:id])
    @by = Survivor.find(params[:by])
  end

  def issue
    Report.create(infected: @infected, by: @by)
    @infected
  end
end