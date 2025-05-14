FactoryBot.define do
  factory :project do
    association :account
    association :client  # ✅ Ajoute cette ligne
    title { "Mon projet" }
    description { "Un projet génial" }
    github_url { "https://github.com/example/project" }
    demo_url { "https://example.com/demo" }
    started_at { 1.month.ago }
    finished_at { Time.current }
    status { "published" }
  end
end
