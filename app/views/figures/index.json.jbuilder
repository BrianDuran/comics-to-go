json.array!(@figures) do |figure|
  json.extract! figure, :id, :character_id, :name, :release_date
  json.url figure_url(figure, format: :json)
end
