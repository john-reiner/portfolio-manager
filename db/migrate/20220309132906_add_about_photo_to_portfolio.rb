class AddAboutPhotoToPortfolio < ActiveRecord::Migration[7.0]
  def change
    add_column :portfolios, :about_photo, :text
  end
end
