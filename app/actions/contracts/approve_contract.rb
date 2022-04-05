# frozen_string_literal: true

module Contracts
  class ApproveContract < Trailblazer::Operation
    step :validate_user, fast_track: true
    step :validate_contract, fast_track: true
    step :notify!
    step :stamp!

    def validate_user(options, *)
      CheckUserEligibilty.call(options)
    end

    def validate_contract(options, *)
      CheckContractValidity.call(options)
    end

    def notify!(options, *)
      NotifyUser.call(options)
    end

    def stamp!(options, *)
      StampContract.call(options)
    end
  end
end
