require 'rails_helper'

RSpec.describe "Authentication", type: :request do
  describe "POST /create-account" do
    it "crée un compte avec un email et mot de passe valides" do
      post "/create-account", params: {
        email: "test@example.com",
        password: "supersecret"
      }.to_json, headers: { "Content-Type" => "application/json" }

      expect(response).to have_http_status(:ok)
    end

    it "échoue si l'email est manquant" do
      post "/create-account", params: {
        password: "supersecret"
      }.to_json, headers: { "Content-Type" => "application/json" }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "POST /login" do
    before do
      post "/create-account", params: {
        email: "test@example.com",
        password: "supersecret"
      }.to_json, headers: { "Content-Type" => "application/json" }
    end

    it "connecte l'utilisateur et retourne un token dans le header Authorization" do
      post "/login", params: {
        email: "test@example.com",
        password: "supersecret"
      }.to_json, headers: { "Content-Type" => "application/json" }

      expect(response).to have_http_status(:ok)
      expect(response.headers["Authorization"]).to be_present
    end

    it "refuse si le mot de passe est incorrect" do
      post "/login", params: {
        email: "test@example.com",
        password: "wrongpass"
      }.to_json, headers: { "Content-Type" => "application/json" }

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /me" do
    it "retourne les infos de l'utilisateur authentifié via le header Authorization" do
      post "/create-account", params: {
        email: "test@example.com",
        password: "supersecret"
      }.to_json, headers: { "Content-Type" => "application/json" }

      post "/login", params: {
        email: "test@example.com",
        password: "supersecret"
      }.to_json, headers: { "Content-Type" => "application/json" }

      token = response.headers["Authorization"]
      get "/me", headers: {
        "Authorization" => token,
        "Content-Type" => "application/json"
      }

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)

      # On s'assure que account existe et contient bien un email
      expect(json["account"]).to be_present
      expect(json["account"]["email"]).to eq("test@example.com")
    end
  end
end
