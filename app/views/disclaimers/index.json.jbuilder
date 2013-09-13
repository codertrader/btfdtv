json.array!(@disclaimers) do |disclaimer|
  json.extract! disclaimer, :description, :disclaimer
  json.url disclaimer_url(disclaimer, format: :json)
end
