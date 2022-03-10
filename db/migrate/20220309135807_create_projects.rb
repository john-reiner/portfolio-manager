class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :portfolio, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :github
      t.string :url
      t.text :main_image_url

      t.timestamps
    end
  end
end
