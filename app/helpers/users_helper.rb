# frozen_string_literal: true

module UsersHelper
  def contract_status(contract)
    return "N/A" unless contract

    if contract.approved_at
      "Approved"
    else
      "Pending approval"
    end
  end

  def contract_signature_status(contract)
    return "N/A" unless contract

    if contract.signed_at
      "Signed"
    else
      "Pending signature"
    end
  end

  def contract_signature_icon(contract)
    return tag.i(class: "bi bi-exclamation-circle") unless contract

    if contract.signed_at
      tag.i(class: "bi bi-sun")
    else
      tag.i(class: "bi bi-cloud-sun")
    end
  end

  def contract_icon(contract)
    return tag.i(class: "bi bi-exclamation-circle") unless contract

    if contract.approved_at
      tag.i(class: "bi bi-cloud-sun")
    else
      tag.i(class: "bi bi-cloud-rain-heavy")
    end
  end
end
