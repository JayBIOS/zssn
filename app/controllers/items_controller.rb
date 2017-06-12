class ItemsController < ApplicationController
  def index
    render json: { data: items,
                   message: 'Retrieved with success' }, status: :ok
  end

  private

  def items
    Item.all
  end
end
