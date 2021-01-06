# frozen_string_literal: true

require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test 'should get github' do
    get authentication_github_url
    assert_response :success
  end
end
