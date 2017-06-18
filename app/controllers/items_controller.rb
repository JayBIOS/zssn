class ItemsController < ApplicationController
  def index
    render json: items.to_json, status: :ok
  end

  private

  def items
    Item.all
  end
end
