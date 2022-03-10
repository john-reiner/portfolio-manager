class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.string :email
      t.string :password_digest
      t.string :welcome_message
      t.text :about_me_text

      t.timestamps
    end
  end
end
