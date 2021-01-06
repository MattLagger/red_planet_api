# frozen_string_literal: true

require 'test_helper'

class RoversControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get rovers_index_url
    assert_response :success
  end
end
