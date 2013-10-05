json.array!(@vendors) do |vendor|
  json.extract! vendor, :name, :division, :address, :city, :state, :zip, :country, :phone, :fax, :email, :website, :description
  json.url vendor_url(vendor, format: :json)
end
