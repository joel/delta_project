# frozen_string_literal: true

module Contracts
  class CheckUserEligibilty < Trailblazer::Operation
    step :validate, fast_track: true

    def validate(options, *)
      return true if legal_age?(options["user"])

      options["message"] = "underage"
      false
    end

    protected

    def legal_age?(user)
      (Time.now.utc.to_date.year - user.birthday.year) > 18
    end
  end
end
