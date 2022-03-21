# frozen_string_literal: true

module Contracts
  class CheckContractValidity < Trailblazer::Operation
    step :validate, fast_track: true

    def validate(options, *)
      return true if document?(options["contract"])

      options["message"] = "missing document"
      false
    end

    protected

    def document?(contract)
      contract.document.attached?
    end
  end
end
