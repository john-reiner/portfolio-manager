class SkillCategory < ApplicationRecord
  belongs_to :portfolio
  has_many :skills
end
