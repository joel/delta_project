# frozen_string_literal: true

module Contracts
  class ApproveContract < Upgrow::Action
    def perform(contract)
      CheckUserEligibilty.new.perform(contract.user)
                         .and_then do |user|
        CheckContractValidity.new.perform(user.contract).and_then do |_contract|
          StampContract.new.perform(user.contract)
          NotifyUser.new.perform(user.contract)
        end
      end
    end
  end
end
