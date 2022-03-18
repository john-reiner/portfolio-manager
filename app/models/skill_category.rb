class SkillCategory < ApplicationRecord
  belongs_to :portfolio
  has_many :skills
  accepts_nested_attributes_for :skills
end
