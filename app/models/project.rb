class Project < ApplicationRecord
  belongs_to :portfolio
  has_one_attached :show_image 

  has_many_attached :images

end
