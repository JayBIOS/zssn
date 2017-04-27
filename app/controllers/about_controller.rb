class AboutController < ApplicationController

  def info
    render json: { message: 'Welcome to the Zombie Survival Social Network',
                   version: version }
  end

  private

  def version
    Rails.application.config.version
  end
end
