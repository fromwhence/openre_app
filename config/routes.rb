Rails.application.routes.draw do

  namespace :api do
  post "/users" => "users#create"
  get "/users/:id" => "users#show"

  get "/properties" => "properties#index"
  post "/properties" => "properties#create"
  get "/properties/:id" => "properties#show"
  patch "/properties/:id" => "properties#update"
  delete "/properties/:id" => "properties#destroy"

  get "/open_houses" => "open_houses#index"
  post "/open_houses" => "open_houses#create"
  get "/open_houses/:id" => "open_houses#show"
  patch "/open_houses/:id" => "open_houses#update"
  delete "/open_houses/:id" => "open_houses#destroy"

  get "/interests" => "interests#index"
  post "/interests" => "interests#create"
  get "/interests/:id" => "interests#show"
  patch "/interests/:id" => "interests#update"
  delete "/interests/:id" => "interests#destroy"

  get "/photos" => "photos#index"
  post "/photos" => "photos#create"
  get "/photos/:id" => "photos#show"
  patch "/photos/:id" => "photos#update"
  delete "/photos/:id" => "photos#destroy"

  post "/buyers" => "buyers#create"
  get "/buyers/:id" => "buyers#show"
  patch "/buyers/:id" => "buyers#update"
  delete "/buyers/:id" => "buyers#destroy"

  post "/realtors" => "realtors#create"
  get "/realtors/:id" => "realtors#show"
  patch "/realtors/:id" => "realtors#update"
  delete "/realtors/:id" => "realtors#destroy"

  post "/sessions" => "sessions#create"

  end

end
