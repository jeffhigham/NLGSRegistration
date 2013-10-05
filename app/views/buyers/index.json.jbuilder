json.array!(@buyers) do |buyer|
  json.extract! buyer, :name, :division, :address, :city, :state, :zip, :country, :phone, :fax, :email, :website, :description
  json.url buyer_url(buyer, format: :json)
end
