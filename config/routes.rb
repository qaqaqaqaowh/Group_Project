Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :show, :edit, :update, :destroy] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index", as: "welcome_index"
  resources :teams
  resources :user_team_approvals
  post "/accept_approval/:id" => "user_team_approvals#accept", as: "accept_approval"
  post "/decline_approval/:id" => "user_team_approvals#decline", as: "decline_approval"
  post "/team/:team_id/delete/user/:user_id" => "teams#deletemember", as:  "delete_member"
  get "/user/:user_id/teams" => "users#myteam", as: "my_team"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "/tournaments/sports" => "tournaments#sports", as: "tournament_sports"
  get "/tournaments/sports/:sport" => "tournaments#sport", as: "tournaments_sport"
  resources :tournaments
  get "/tournaments/:id/join" => "tournaments#join", as: "join_tournament"
  post "/tournaments/:id/approve" => "tournaments#approve", as: "approve_team_tournament"
  get 'payment/new'
  post 'payment/checkout'
  post 'tournament/:tournament_id/delete/team/:team_id' => "tournaments#remove_team", as: "remove_team"
end
