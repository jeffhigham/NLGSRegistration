json.array!(@companies) do |company|
  json.extract! company, :name, :division, :address, :city, :state, :zip, :country, :phone, :fax, :email, :website, :description
  json.url company_url(company, format: :json)
end
