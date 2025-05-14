class Skill < ApplicationRecord
  has_and_belongs_to_many :projects

  validates :name, presence: true, uniqueness: true
  validates :level, presence: true
  validates :icon, presence: true
end
