# frozen_string_literal: true

module Contracts
  class CheckUserEligibilty < Upgrow::Action
    result :user

    def perform(user)
      if legal_age?(user)
        result.success(user:)
      else
        result.failure(detail: "underage")
      end
    end

    protected

    def legal_age?(user)
      (Time.now.utc.to_date.year - user.birthday.year) > 18
    end
  end
end
