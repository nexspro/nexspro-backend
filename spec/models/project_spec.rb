require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should belong_to(:account) }
  it { should belong_to(:client).optional }
  it { should have_and_belong_to_many(:skills) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:github_url) }
  it { should validate_inclusion_of(:status).in_array(%w[draft published archived]) }
end
