json.array!(@contributors) do |contributor|
  json.extract! contributor, :name, :email, :twitter, :stocktwits, :facebook, :short_bio, :full_bio, :featured
  json.url contributor_url(contributor, format: :json)
end
