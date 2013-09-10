json.array!(@streams) do |stream|
  json.extract! stream, :name
  json.url stream_url(stream, format: :json)
end
