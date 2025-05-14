class Client < ApplicationRecord
  has_many :projects, dependent: :nullify

  validates :name, presence: true, length: { minimum: 2 }
  validates :website, presence: true, format: URI.regexp(%w[http https])
  validates :logo, presence: true, format: URI.regexp(%w[http https]), allow_blank: true
end
