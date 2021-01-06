# frozen_string_literal: true

Rails.application.routes.draw do
  resources :favorites
  # Rotas API NASA
  get '/rovers', to: 'rovers#index'
  get '/manifests/:rover', to: 'rovers#manifests'
  post '/photos', to: 'rovers#photos'

  get '/auth/github', to: 'authentication#github', format: false

  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
