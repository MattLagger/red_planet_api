Rails.application.routes.draw do
  # Rotas API NASA
  get '/rovers', to: 'rovers#index'
  get '/manifests/:rover', to: 'rovers#manifests'
  get '/photos', to: 'rovers#photos'

  get '/auth/github', to: 'authentication#github', format: false

  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
