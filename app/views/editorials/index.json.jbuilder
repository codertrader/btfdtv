json.array!(@editorials) do |editorial|
  json.extract! editorial, :entry
  json.url editorial_url(editorial, format: :json)
end
