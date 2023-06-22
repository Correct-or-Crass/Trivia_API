Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :trivia, only: :index
  
  namespace :api do
    namespace :v1 do
      resources :game_plays, only: :index
      resources :endgame, only: :index
    end
  end
end
