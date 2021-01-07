# frozen_string_literal: true

class ApplicationController < ActionController::API
  def current_user
    return nil unless request.headers[:Authorization].present?

    token = request.headers[:Authorization].split(' ').last

    payload = TokiToki.decode(token)
    @current_user ||= User.find(payload[0]['sub'])
  end

  def logged_in?
    current_user != nil
  end

  def authenticate_user!
    head :unauthorized unless logged_in?
  end
end
