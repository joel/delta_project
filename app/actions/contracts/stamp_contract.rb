# frozen_string_literal: true

module Contracts
  class StampContract < Trailblazer::Operation
    step :stamp!

    def stamp!(options, *)
      if options["contract"].approved_at
        options["message"] = "contract was already approved!"
        false
      else
        options["contract"].update(approved_at: Time.now)
        true
      end
    end
  end
end
