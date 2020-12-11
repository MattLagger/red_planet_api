Rails.application.routes.draw do
  get '/rovers', to: 'rovers#index'
  get '/auth/github', to: 'authentication#github', format: false
  
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
