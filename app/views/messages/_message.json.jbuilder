json.extract! message, :name, :email, :message, :created_at, :updated_at
json.url message_url(message, format: :json)
