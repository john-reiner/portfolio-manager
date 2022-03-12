class Project < ApplicationRecord
  belongs_to :portfolio
  has_many_attached :images
end
