Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"

  get "/sign_up", to: "registrations#new"

  get "/songs", to: "songs#index"
  get "/songs/:id", to: "songs#show"

  get "/artists", to: "artists#index"
  get "/artists/new", to: "artists#new"
  get "/artists/:id", to: "artists#show"
  get "artists/:id/edit", to: "artists#edit"
  post "/artists", to: "artists#create"
  patch "/artists/:id", to: "artists#update"
  delete "/artists/:id", to: "artists#destroy"

  get "artists/:id/songs/new", to: "songs#new"
  post "artists/:id/songs", to: "songs#create"
  get "artists/:artist_id/songs", to: "songs#index"
end
