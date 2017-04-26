class ApplicationController < ActionController::API
  rescue_from ArgumentError, with: :render_error

  protected

  def render_error(e)
    render json: {error: e.message}, status: :unprocessable_entity
  end
end
