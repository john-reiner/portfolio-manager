class RemoveMainImageUrlFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :main_image_url, :string
  end
end
