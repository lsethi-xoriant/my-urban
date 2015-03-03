json.array!(@cities) do |city|
  json.extract! city, :id, :en_name, :ua_name, :ru_name
  json.url city_url(city, format: :json)
end
