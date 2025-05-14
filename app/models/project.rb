class Project < ApplicationRecord
  belongs_to :account
  belongs_to :client, optional: true
  has_and_belongs_to_many :skills

  validates :title, presence: true
  validates :description, presence: true
  validates :github_url, presence: true, format: URI.regexp(%w[http https])
  validates :demo_url, presence: true, format: URI.regexp(%w[http https])
  validates :started_at, presence: true
  validates :finished_at, presence: true
  validates :status, presence: true, inclusion: { in: %w[draft published archived] }
end
