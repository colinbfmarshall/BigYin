json.extract! topic, :title, :description, :location, :wikipedia, :deadline, :active, :created_at, :updated_at
json.url topic_url(topic, format: :json)