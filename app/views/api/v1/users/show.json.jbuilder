json.(@user, :id)
json.list do
  json.id @user.list.id
  json.currencies_count @user.list.currencies_count
  json.base_currency @user.list.base_currency
  json.currencies @user.list.currencies do |currency|
    json.id currency.id
    json.code currency.code
  end
end
