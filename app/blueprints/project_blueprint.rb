class ProjectBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :description, :github_url, :demo_url,
         :started_at, :finished_at, :status

  association :skills, blueprint: SkillBlueprint
  association :client, blueprint: ClientBlueprint, default: nil
end
