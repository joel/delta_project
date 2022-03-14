# frozen_string_literal: true

module ContractsHelper
  def contract_link(user)
    return link_to(user.contract.title, user_contract_url(user, user.contract)) if user.contract

    link_to("New contract", new_user_contract_url(user))
  end

  def document_name(contract)
    return "N/A" unless contract.document.attached?

    contract.document.filename.to_s
  end
end
