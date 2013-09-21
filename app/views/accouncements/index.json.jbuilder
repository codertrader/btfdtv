json.array!(@accouncements) do |accouncement|
  json.extract! accouncement, :message, :starts_at, :ends_at
  json.url accouncement_url(accouncement, format: :json)
end
