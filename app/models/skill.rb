class Skill < ApplicationRecord
  belongs_to :skill_category
  validates :name, presence: true
end
