# frozen_string_literal: true

module Contracts
  class ApproveContract
    extend LightService::Organizer

    def self.call(ctx)
      with(ctx).reduce(actions)
    end

    def self.actions
      [
        CheckUserEligibilty,
        CheckContractValidity,
        StampContract,
        NotifyUser
      ]
    end
  end
end
