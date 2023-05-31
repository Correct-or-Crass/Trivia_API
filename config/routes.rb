Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :trivia, only: :index
  #  if Rails.env.development?
  #   mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  #  end

  # namespace :api do
  #   namespace :v1 do
  #     resources :endgame_apis, only: :index
  #     resources :game_play_apis, only: :index
  #   end
  # end
end
