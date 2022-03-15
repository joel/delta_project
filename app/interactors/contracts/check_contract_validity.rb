# frozen_string_literal: true

module Contracts
  class CheckContractValidity
    include Interactor

    def call
      context.fail!(message: "missing document") unless document?
    end

    private

    def document?
      context.contract.document.attached?
    end
  end
end
