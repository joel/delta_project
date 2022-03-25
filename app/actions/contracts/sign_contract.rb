# frozen_string_literal: true

module Contracts
  class SignContract < Upgrow::Action
    result :contract

    def perform(contract:, input:)
      if input.valid?
        contract.update(signed_at: Time.now)
        result.success(contract:)
      else
        result.failure(input.errors)
      end
    end
  end
end
