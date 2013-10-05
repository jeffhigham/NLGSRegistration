json.array!(@industries) do |industry|
  json.extract! industry, :company_id, :name, :description
  json.url industry_url(industry, format: :json)
end
