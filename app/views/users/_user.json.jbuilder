json.extract! user, :id, :first_name, :last_name, :email, :birthday, :created_at, :updated_at
json.contract do
  json.id user.contract.id
  json.title user.contract.title
  json.url user_contract_url(user_id: user, id: user.contract, format: :json)
end
json.url user_url(user, format: :json)
