class Portfolio < ApplicationRecord
    has_secure_password
    validates :email, presence: true
    has_one_attached :image, dependent: :destroy
    has_one_attached :resume, dependent: :destroy
    validates :image, content_type: [:png, :jpg, :jpeg]
    has_many :projects
    has_many :skill_categories
    has_many :messages
end
