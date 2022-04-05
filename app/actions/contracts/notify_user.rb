# frozen_string_literal: true

module Contracts
  class NotifyUser < Trailblazer::Operation
    step :notify!

    def notify!(options, *)
      if options["contract"].approved_at
        ContractsMailer.approved(options["contract"]).deliver_later
      else
        ContractsMailer.rejected(options["contract"]).deliver_later
      end
    end
  end
end
