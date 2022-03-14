class AddGithubToPortfolio < ActiveRecord::Migration[7.0]
  def change
    add_column :portfolios, :github, :string
  end
end
