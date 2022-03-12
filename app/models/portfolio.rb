class Portfolio < ApplicationRecord
    has_secure_password
    has_one_attached :image
    has_many :projects
    has_many :skill_categories
    has_many :messages
end
