Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"

  get "/articles", to: "articles#index"
  ## route declares that GET /articles requests are mapped to the index action of ArticlesController
  ## to create ArticlesController and its index action, run the controller generator (with --skip-routes because we already have a route) in terminal
  ## bin/rails generate controller Articles index --skip-routes

  get "/articles/:id", to: "articles#show"

end
