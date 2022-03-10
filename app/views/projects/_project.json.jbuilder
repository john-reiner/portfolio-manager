json.extract! project, :id, :portfolio_id, :name, :description, :github, :url, :main_image_url, :created_at, :updated_at
json.url project_url(project, format: :json)