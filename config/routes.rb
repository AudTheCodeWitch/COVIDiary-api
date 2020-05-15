Rails.application.routes.draw do
  # wrap routes in /api namespace
  namespace :api do
    # creates index route for all entries at /api/entries
    resources :entries, only: [:index]
    # creates routes for users at api/users
    resources :users do
      # creates routes for a specific user's entries at
      # api/users/:user_id/entries
      resources :entries
    end
  end
end
