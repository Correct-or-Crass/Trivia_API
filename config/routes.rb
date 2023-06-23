Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      resources :endgame_apis, only: :index
      resources :game_play_apis, only: :index
    end
  end
  
  match '*unmatched', to: 'application#route_not_found', via: :all 
end