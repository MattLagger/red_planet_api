class RoversController < ApplicationController
  before_action :authenticate_user!

  def index
    rovers = NasaRovers.new
    rovers_list = rovers.all_rovers

    render json: rovers_list
  end

  def manifests
    rovers = NasaRovers.new
    rovers_list = rovers.manifests(rover_params[:rover])

    render json: rovers_list
  end

  def photos
    rovers = NasaRovers.new

    data = rovers.photos(rover_params)

    render json: data
  end

  private

  def rover_params
    params.permit(:rover, :earth_date, :page)
  end
end
