Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      resources :game_plays, only: :index
      resources :endgame, only: :index
    end
  end
  get '/', to: 'home#index'
  match '*unmatched', to: 'application#route_not_found', via: :all 
end