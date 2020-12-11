class AuthenticationController < ApplicationController
  def github
    authenticator = Authenticator.new
    user_info = authenticator.github(params[:code])

    token = generate_token(user_info)

    redirect_to "#{issuer}?token=#{token}"
  rescue StandardError => e
    redirect_to "#{user_info['issuer']}?error=#{e.message}"
  end

  private

  def issuer
    ENV['RED_PLANET_CLIENT_URL']
  end

  def generate_token(user_info)
    user_data = JSON.parse(user_info[:user_data])

    login = user_data['login']
    name = user_data['name']
    email = user_data['email']
    avatar_url = user_data['avatar_url']

    user = User.where(login: login).first_or_create!(name: name, avatar_url: avatar_url, login: login, email: email)

    TokiToki.encode(user[:id])
  end
end
