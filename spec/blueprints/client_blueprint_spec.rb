require 'rails_helper'

RSpec.describe ClientBlueprint, type: :blueprint do
  let(:client) { create(:client) }

  subject(:json) { described_class.render_as_hash(client) }

  it "renders the correct JSON structure" do
    expect(json).to include(
      id: client.id,
      name: client.name,
      website: client.website,
      logo: client.logo
    )
  end
end
