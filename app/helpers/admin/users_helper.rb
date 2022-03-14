# frozen_string_literal: true

module Admin
  module UsersHelper
    def admin_contract_status(user)
      return link_to("No contract yet", new_user_contract_url(user)) unless user.contract
      return "Approved" if user.contract.approved_at.present?

      "Pending Approval"
    end

    def admin_contract_buttons(user)
      return "N/A" unless user.contract

      return cancel_button(user.contract) if user.contract.approved_at.present?

      approve_button(user.contract)
    end

    private

    def cancel_button(contract)
      form_tag("/admin/contracts/approvals/#{contract.id}", method: :delete) do
        button_tag(type: "submit") do
          content_tag(:strong, "Cancel it!")
        end
      end
    end

    def approve_button(contract)
      form_tag("/admin/contracts/approvals/#{contract.id}", method: :put) do
        button_tag(type: "submit") do
          content_tag(:strong, "Approve")
        end
      end
    end
  end
end