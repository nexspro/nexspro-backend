FactoryBot.define do
  factory :client do
    name { "Nom du client" }
    website { "https://client.com" }
    logo { "https://client.com/logo.png" }
  end
end
