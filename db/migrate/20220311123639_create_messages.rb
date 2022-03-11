class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :portfolio, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
