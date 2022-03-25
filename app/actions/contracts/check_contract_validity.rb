# frozen_string_literal: true

module Contracts
  class CheckContractValidity < Upgrow::Action
    result :contract

    def perform(contract)
      if document?(contract)
        result.success(contract:)
      else
        result.failure(detail: "missing document")
      end
    end

    protected

    def document?(contract)
      contract.document.attached?
    end
  end
end
