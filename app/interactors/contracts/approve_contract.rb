# frozen_string_literal: true

module Contracts
  class ApproveContract
    include Interactor::Organizer

    organize CheckUserEligibilty, CheckContractValidity, StampContract, NotifyUser
  end
end
