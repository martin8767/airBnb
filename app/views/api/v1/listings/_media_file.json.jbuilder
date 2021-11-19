json.media_file do
  json.id media_file.id
  json.url polymorphic_url(media_file)
end
