require 'rails_helper'

RSpec.describe "POST /login", type: :request do
  let(:headers) do
    {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }
  end

  let(:password) { "supernexs26" }
  let(:account) { create(:account, email: "nexspro@hotmail.com", password: password, verified: true) }

  it "connecte l'utilisateur et retourne un token JWT dans le header Authorization" do
    account

    post "/login", params: {
      email: account.email,
      password: password
    }.to_json, headers: headers

    expect(response).to have_http_status(:ok)
    token = response.headers["Authorization"]
    expect(token).to be_present
    expect(token).to match(/^Bearer /)
  end

  it "refuse la connexion si le mot de passe est invalide" do
    account

    post "/login", params: {
      email: account.email,
      password: "wrongpass"
    }.to_json, headers: headers

    expect(response).to have_http_status(:unauthorized)
  end
end
