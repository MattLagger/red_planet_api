class RoversController < ApplicationController
  def index
    rovers = NasaRovers.new
    rovers_list = rovers.all_rovers

    render json: rovers_list
  end

  def manifests
    rovers = NasaRovers.new
    rovers_list = rovers.manifests(params[:rover])

    render json: rovers_list
  end

  def photos
    rovers = NasaRovers.new
    rovers_list = rovers.photos(params)

    render json: rovers_list
  end
end
