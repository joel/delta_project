# frozen_string_literal: true

module Contracts
  class StampContract
    include Interactor

    def call
      context.contract.update(approved_at: Time.now)
    end
  end
end
