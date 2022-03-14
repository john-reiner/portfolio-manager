class AddLinkedinToPortfolio < ActiveRecord::Migration[7.0]
  def change
    add_column :portfolios, :linkedin, :string
  end
end
