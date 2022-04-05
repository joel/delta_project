# frozen_string_literal: true

module Contracts
  class StampContract
    extend ::LightService::Action

    expects :contract

    executed do |context|
      context.contract.update(approved_at: Time.now)
    end
  end
end
