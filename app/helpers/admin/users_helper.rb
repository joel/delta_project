# frozen_string_literal: true

module Admin
  module UsersHelper
    def admin_contract_status(user)
      return link_to("No contract yet", new_user_contract_url(user)) unless user.contract
      return "Approved" if user.contract.approved_at.present?

      "Pending Approval"
    end

    def admin_contract_signature_status(user)
      return link_to("No contract yet", new_user_contract_url(user)) unless user.contract
      return "Signed" if user.contract.signed_at.present?

      "Pending Signature"
    end

    def admin_contract_buttons(user)
      return "N/A" unless user.contract

      return cancel_button(user.contract) if user.contract.approved_at.present?

      approve_button(user.contract)
    end

    def admin_signed_buttons(user)
      return "N/A" unless user.contract

      return unsigned_button(user.contract) if user.contract.signed_at.present?

      signed_button(user.contract)
    end

    def document_attached?(contract)
      return "N/A" unless contract

      contract.document.attached?.to_s
    end

    private

    def cancel_button(contract)
      form_tag("/admin/contracts/approvals/#{contract.id}", method: :delete) do
        button_tag(type: "submit", class: "btn btn-danger") do
          content_tag(:strong, "Reject")
        end
      end
    end

    def approve_button(contract)
      form_tag("/admin/contracts/approvals/#{contract.id}", method: :put) do
        button_tag(type: "submit", class: "btn btn-success") do
          content_tag(:strong, "Approve")
        end
      end
    end

    def signed_button(contract)
      form_tag("/admin/contracts/signatures/#{contract.id}", method: :patch) do
        button_tag(type: "submit", class: "btn btn-success") do
          content_tag(:strong, "Signed")
        end
      end
    end

    def unsigned_button(contract)
      form_tag("/admin/contracts/signatures/#{contract.id}", method: :delete) do
        button_tag(type: "submit", class: "btn btn-danger") do
          content_tag(:strong, "Unsigned")
        end
      end
    end
  end
end
