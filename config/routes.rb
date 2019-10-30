Rails.application.routes.draw do

  namespace :api do
  post "/users" => "users#create"
  get "/users/:id" => "users#show"

  post "/properties" => "properties#create"
  get "/properties" => "properties#show"
  patch "/properties/:id" => "properties#update"
  delete "/properties/:id" => "properties#destroy"

  post "/sessions" => "sessions#create"

  end

end
