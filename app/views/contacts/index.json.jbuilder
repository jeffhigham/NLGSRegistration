json.array!(@contacts) do |contact|
  json.extract! contact, :company_id, :primary_contact, :first_name, :last_name, :title, :phone, :email
  json.url contact_url(contact, format: :json)
end
