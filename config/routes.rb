Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index", as: :root

  get "/sign_up", to: "registrations#new"
  post "/sign_up", to: "registrations#create"

  get "/sign_in", to: "sessions#new"
  post "/sign_in", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  get "/password", to: "passwords#edit"
  patch "/password", to: "passwords#update"

  get "/password/reset", to: "password_reset#new"
  post "/password/reset", to: "password_reset#create"
  get "/password/reset/edit", to: "password_reset#edit"
  patch "/password/reset/update", to: "password_reset#update"

  get "/songs", to: "songs#index", as: :songs #keeps the name the same
  get "/songs/:id", to: "songs#show"

  get "/artists", to: "artists#index"
  get "/artists/new", to: "artists#new"
  get "/artists/:id", to: "artists#show"
  get "artists/:id/edit", to: "artists#edit"
  post "/artists", to: "artists#create"
  patch "/artists/:id", to: "artists#update"
  delete "/artists/:id", to: "artists#destroy"

  get "/artists/:id/songs/new", to: "songs#new"
  post "/artists/:id/songs", to: "songs#create"
  get "/artists/:artist_id/songs", to: "songs#index"

  get "/playlists", to: "playlists#index"
end
