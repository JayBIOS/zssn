class SurvivorsController < ApplicationController
  def create
    survivor = survivor_service.register

    if survivor.save
      render json: survivor.to_json, status: :created
    else
      render json: {error: survivor.errors}, status: :unprocessable_entity
    end
  end

  private

  def survivor_service
    SurvivorService.new(survivor_params)
  end

  def survivor_params
    params.permit :name, :age, :gender, :last_location, :inventory
  end
end
