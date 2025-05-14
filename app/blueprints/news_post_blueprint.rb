class NewsPostBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :content, :published_at
end
