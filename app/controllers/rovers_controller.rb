class RoversController < ApplicationController
  def index
    rovers = NasaRovers.new
    rovers_list = rovers.all

    render json: rovers_list
  end
end
