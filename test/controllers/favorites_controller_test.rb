# frozen_string_literal: true

require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite = favorites(:one)
  end

  test 'should get index' do
    get favorites_url, as: :json
    assert_response :success
  end

  test 'should create favorite' do
    assert_difference('Favorite.count') do
      post favorites_url,
           params: { favorite: { camera_name: @favorite.camera_name, image_date: @favorite.image_date, image_id: @favorite.image_id, image_url: @favorite.image_url, rover_name: @favorite.rover_name, user_id: @favorite.user_id } }, as: :json
    end

    assert_response 201
  end

  test 'should show favorite' do
    get favorite_url(@favorite), as: :json
    assert_response :success
  end

  test 'should update favorite' do
    patch favorite_url(@favorite),
          params: { favorite: { camera_name: @favorite.camera_name, image_date: @favorite.image_date, image_id: @favorite.image_id, image_url: @favorite.image_url, rover_name: @favorite.rover_name, user_id: @favorite.user_id } }, as: :json
    assert_response 200
  end

  test 'should destroy favorite' do
    assert_difference('Favorite.count', -1) do
      delete favorite_url(@favorite), as: :json
    end

    assert_response 204
  end
end
