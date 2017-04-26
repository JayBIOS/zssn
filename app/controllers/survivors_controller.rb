class SurvivorsController < ApplicationController
  def create
    survivor = survivor_service.register

    if survivor.save
      render json: survivor.to_json, status: :created
    else
      render json: { error: survivor.errors }, status: :unprocessable_entity
    end
  end

  def update
    survivor = survivor_service.update

    if survivor.save
      render json: survivor.to_json, status: :ok
    else
      render json: { error: survivor.errors }, status: :unprocessable_entity
    end
  end

  def report
    survivor = report_service.issue
    render json: { message: "#{survivor.name} reported as infected" }
  end

  private

  def survivor_service
    SurvivorService.new survivor_params
  end

  def report_service
    ReportService.new report_params
  end

  def survivor_params
    params.permit :id, :name, :age, :gender, :last_location, :inventory
  end

  def report_params
    params.permit :id, :by
  end
end
