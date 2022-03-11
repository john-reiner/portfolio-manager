class CreateSkillCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :skill_categories do |t|
      t.references :portfolio, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
