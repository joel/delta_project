# frozen_string_literal: true

module Contracts
  class CheckUserEligibilty
    include Interactor

    def call
      context.fail!(message: "underage") unless legal_age?
    end

    private

    def legal_age?
      (Time.now.utc.to_date.year - context.user.birthday.year) > 18
    end
  end
end
