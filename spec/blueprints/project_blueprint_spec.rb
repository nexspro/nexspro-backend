require 'rails_helper'

RSpec.describe ProjectBlueprint do
  let(:project) { create(:project) }

  it "renders the correct JSON structure" do
    json = JSON.parse(ProjectBlueprint.render(project))
    expect(json["id"]).to eq(project.id)
    expect(json["title"]).to eq(project.title)
    expect(json["status"]).to eq(project.status)
  end
end
