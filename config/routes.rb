Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :projects
      resources :skills
      resources :clients
      resources :release_notes
      resources :news_posts
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
