# frozen_string_literal: true

Rails.application.routes.draw do
  # Rotas API NASA
  get '/rovers', to: 'rovers#index'
  get '/manifests/:rover', to: 'rovers#manifests'
  post '/photos', to: 'rovers#photos'

  # Rotas Autenticacao Usuário via Github
  get '/auth/github', to: 'authentication#github', format: false

  # Rotas Favoritos
  scope 'favorites' do
    get '/', to: 'favorites#index'
    post '/', to: 'favorites#create'
    delete '/:id', to: 'favorites#destroy'
  end

  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
