json.array!(@announcements) do |announcement|
  json.extract! announcement, :message, :starts_at, :ends_at
  json.url announcement_url(announcement, format: :json)
end
