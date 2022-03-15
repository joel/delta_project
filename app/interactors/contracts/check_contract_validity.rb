# frozen_string_literal: true

module Contracts
  class CheckContractValidity
    extend ::LightService::Action

    expects :contract

    executed do |context|
      context.fail!("missing document") unless document?(context.contract)
    end

    def self.document?(contract)
      contract.document.attached?
    end
  end
end
