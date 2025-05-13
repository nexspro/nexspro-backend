Rails.application.routes.draw do
  get "/me", to: "me#show"
  get "up" => "rails/health#show", as: :rails_health_check
end
