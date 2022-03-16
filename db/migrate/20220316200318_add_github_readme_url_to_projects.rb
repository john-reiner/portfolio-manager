class AddGithubReadmeUrlToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :github_readme_url, :string
    add_column :projects, :show_readme, :boolean
  end
end
