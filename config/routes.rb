Rails.application.routes.draw do
  get "/locations", to: "locations#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/humans", to: "humans#update"
end
