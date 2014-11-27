json.array!(@photos) do |photo|
  json.extract! photo, :id, :image, :caption
  json.url photo_url(photo, format: :json)
end
