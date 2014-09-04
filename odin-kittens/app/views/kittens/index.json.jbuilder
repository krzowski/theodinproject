json.array!(@kittens) do |kitten|
  json.extract! kitten, :id, :name, :age, :cuteness, :softness
  json.url kitten_url(kitten, format: :json)
end
