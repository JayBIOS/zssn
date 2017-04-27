class ReportService
  def initialize(params)
    @infected = Survivor.find(params[:id])
    @by = Survivor.find(params[:by])
  end

  def issue
    Report.new(infected: @infected, by: @by)
  end
end