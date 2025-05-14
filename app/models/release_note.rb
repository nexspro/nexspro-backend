class ReleaseNote < ApplicationRecord
  validates :version, presence: true, uniqueness: true
  validates :content, presence: true
  validates :published_at, presence: true

  scope :recent_first, -> { order(published_at: :desc) }
end
