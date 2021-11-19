json.listing listing, :id, :description, :top_amount_people, :price_per_night, 
  :amenities, :categories, :user 

json.media_files do
  json.array! listing.media_files, partial: 'media_file', as: :media_file
end
