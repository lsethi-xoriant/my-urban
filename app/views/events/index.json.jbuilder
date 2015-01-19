json.array!(@events) do |event|
  json.extract! event, :id, :name, :adress, :description, :data, :timeStart, :endTime, :photo
  json.url event_url(event, format: :json)
end
