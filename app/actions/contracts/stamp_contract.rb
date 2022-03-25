# frozen_string_literal: true

module Contracts
  class StampContract < Upgrow::Action
    result :contract

    def perform(contract)
      if contract.approved_at
        result.failure(detail: "contract was already approved!")
      else
        contract.update(approved_at: Time.now)
        result.success(contract:)
      end
    end
  end
end
