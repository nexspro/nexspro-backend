class ReleaseNoteBlueprint < Blueprinter::Base
  identifier :id

  fields :version, :content, :published_at
end
