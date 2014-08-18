json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :status, :remember_token, :admin
  json.url user_url(user, format: :json)
end
