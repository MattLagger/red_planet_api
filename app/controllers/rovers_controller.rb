class RoversController < ApplicationController
  before_action :authenticate_user!

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

    render json: current_user
  end
end
