FactoryBot.define do
  factory :account do
    email { "user@example.com" }
    password { "password123" }
    status { :verified }
  end
end
