json.array!(@avatars) do |avatar|
  json.extract! avatar, :id, :avatar
  json.url avatar_url(avatar, format: :json)
end
