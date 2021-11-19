json.listings do
  json.array! @listings, partial: 'listing', as: :listing
end
