Rails.application.routes.draw do

  root 'home#index'

  resources :users

  get '/auth/:provider/callback' => 'authentication#index'

  get 'game/:ID' =>'game#show'

  get 'game' => 'game#index'

  get 'about' => 'about#index'

  get 'terms' => 'about#terms'

  get '/' => 'game#index'

  get '/sign-up' => 'registrations#new', as: :signup
  post '/sign-up' => 'registrations#create'
  get '/sign-in' => 'authentication#new', as: :signin
  post '/sign-in' => 'authentication#create'
  get '/sign-out' => 'authentication#destroy', as: :signout

end
