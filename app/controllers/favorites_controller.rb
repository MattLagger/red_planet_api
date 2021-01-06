# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[show update destroy]
  before_action :authenticate_user!

  # GET /favorites
  def index
    @favorites = Favorite.where(user_id: current_user.id)

    render json: @favorites
  end

  # POST /favorites
  def create
    @favorite = Favorite.new(favorite_params)
    @favorite[:user_id] = current_user.id

    if @favorite.save
      render json: @favorite
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favorites/1
  def destroy
    @favorite.destroy
    @favorites = Favorite.where(user_id: current_user.id)
    render json: @favorites
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def favorite_params
    params.require(:favorite).permit(:image_id, :image_url, :image_date, :rover_name, :camera_name)
  end
end
