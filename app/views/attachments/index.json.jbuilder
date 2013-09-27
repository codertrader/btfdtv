json.array!(@attachments) do |attachment|
  json.extract! attachment, :stream_id, :name, :link, :bytes, :icon, :thumbnails_64x64, :thumbnails_200x200, :thumbnails_640x480
  json.url attachment_url(attachment, format: :json)
end
