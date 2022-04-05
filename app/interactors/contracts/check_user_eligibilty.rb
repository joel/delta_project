# frozen_string_literal: true

module Contracts
  class CheckUserEligibilty
    extend ::LightService::Action

    expects :user

    executed do |context|
      context.fail!("underage") unless legal_age?(context.user)
    end

    def self.legal_age?(user)
      (Time.now.utc.to_date.year - user.birthday.year) > 18
    end
  end
end
