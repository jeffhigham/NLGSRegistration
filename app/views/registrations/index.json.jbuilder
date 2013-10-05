json.array!(@registrations) do |registration|
  json.extract! registration, :registration_id, :payment_status, :payment_type
  json.url registration_url(registration, format: :json)
end
