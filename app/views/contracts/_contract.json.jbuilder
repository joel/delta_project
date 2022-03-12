json.extract! contract, :id, :title, :content, :user_id, :signed_at, :approved_at, :activated_at, :created_at, :updated_at
json.url user_contract_url(user_id: contract.user, id: contract, format: :json)
