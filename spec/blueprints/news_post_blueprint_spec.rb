require 'rails_helper'

RSpec.describe NewsPostBlueprint, type: :blueprint do
  let(:news_post) { create(:news_post) }

  subject(:json) { described_class.render_as_hash(news_post) }

  it 'rend le JSON correct' do
    expect(json).to match(
      a_hash_including(
        id: news_post.id,
        title: news_post.title,
        content: news_post.content,
        published_at: news_post.published_at.utc.iso8601
      )
    )
  end
end
