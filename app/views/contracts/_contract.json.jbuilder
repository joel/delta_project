json.extract! contract, :id, :title, :content, :user_id, :signed_at, :approved_at, :activated_at, :created_at, :updated_at
json.url contract_url(contract, format: :json)
