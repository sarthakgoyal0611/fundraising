json.extract! event, :id, :title, :description, :Amount, :created_at, :updated_at
json.url event_url(event, format: :json)
