# frozen_string_literal: true

module Contracts
  class NotifyUser
    extend ::LightService::Action

    expects :contract

    executed do |context|
      if context.contract.approved_at
        ContractsMailer.approved(context.contract).deliver_later
      else
        ContractsMailer.rejected(context.contract).deliver_later
      end
    end
  end
end
