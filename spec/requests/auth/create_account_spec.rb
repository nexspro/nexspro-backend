require 'rails_helper'

RSpec.describe "POST /create-account", type: :request do
  let(:headers) do
    {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }
  end

  let(:email) { "nexspro@hotmail.com" }
  let(:password) { "supernexs26" }

  it "crée un compte et retourne un message de succès" do
    post "/create-account", params: {
      email: email,
      password: password
    }.to_json, headers: headers

    expect(response).to have_http_status(:ok)

    json = JSON.parse(response.body)
    expect(json["success"]).to match(/email has been sent/i)

    account = Account.find_by(email: email)
    expect(account).not_to be_nil
    expect(account.status).to eq(0)
  end

  it "ne crée pas de compte sans email" do
    post "/create-account", params: {
      password: password
    }.to_json, headers: headers

    expect(response).to have_http_status(:unprocessable_entity)
  end

  it "ne crée pas de compte si déjà existant" do
    create(:account, email: email, verified: false)

    post "/create-account", params: {
      email: email,
      password: password
    }.to_json, headers: headers

    expect(response).to have_http_status(:unprocessable_entity)
  end
end
