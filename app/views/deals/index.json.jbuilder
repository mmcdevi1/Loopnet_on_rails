json.array!(@deals) do |deal|
  json.extract! deal, :id, :property_name, :user_id, :property_address, :state, :city, :zipcode
  json.url deal_url(deal, format: :json)
end
