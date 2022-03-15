# frozen_string_literal: true

module Contracts
  class NotifyUser < Upgrow::Action
    result :contract

    def perform(contract)
      if contract.approved_at
        ContractsMailer.approved(contract).deliver_later
      else
        ContractsMailer.rejected(contract).deliver_later
      end
      result.success(contract:)
    end
  end
end
