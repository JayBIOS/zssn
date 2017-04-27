class ReportsController < ApplicationController
  def infected
    if Survivor.any?
      infected_survivors = survivors.select(&:infected?)
      percentage = (infected_survivors.length.to_f / survivors.length) * 100
      render json: { percentage: percentage,
                     message: "#{percentage}% are infected with the virus!" },
             status: :ok
    else
      render json: { percentage: 0,
                     message: "You're alone my friend..." }, status: :ok
    end
  end

  def non_infected
    if Survivor.any?
      healthy_survivors = survivors.reject(&:infected?)
      percentage = (healthy_survivors.length.to_f / survivors.length) * 100
      render json: { percentage: percentage,
                     message: "#{percentage}% are healthy!" },
             status: :ok
    else
      render json: { percentage: 100,
                     message: "You're alone my friend..." }, status: :ok
    end
  end

  def average_resource
    sum_by_item = Stack.includes(:item)
                       .group(:item_id)
                       .select(:item_id, 'SUM(quantity) as quantity')

    average = sum_by_item.map do |i|
      [i.item.name, per_survivor(i.quantity || 0)]
    end.to_h

    render json: { average: average }, status: :ok
  end

  def points_lost
    infected_survivors = survivors.select(&:infected?)
    points = infected_survivors.map { |i| i.inventory.value }.inject(0, :+)

    render json: { points_lost: points,
                   message: "#{points} points were lost because of the "\
                            'infected' }
  end

  private

  def survivors
    Survivor.all
  end

  def per_survivor(value)
    Survivor.any? ? value.to_f / Survivor.all.count : 0
  end
end
