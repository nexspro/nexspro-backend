FactoryBot.define do
  factory :news_post do
    title { "Nouvelle importante" }
    content { "Contenu de la news." }
    published_at { Time.current }
  end
end
