json.array!(@users) do |user|
  json.extract! user, :id, :name, :confirmation_token
  json.url user_url(user, format: :json)
end
