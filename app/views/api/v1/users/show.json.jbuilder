json.(@user, :id)
json.list do
  json.id @user.list.id
  json.currencies_count @user.list.currencies_count
  json.currencies @user.list.currencies do |currency|
    json.code currency.code
  end
end
