json.array!(@sliders) do |slider|
  json.extract! slider, :id, :slider_image, :caption
  json.url slider_url(slider, format: :json)
end
