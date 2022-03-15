# frozen_string_literal: true

require "test_helper"

module Contracts
  class CheckUserEligibiltyTest < ActiveSupport::TestCase
    test "happy path" do
      birthday = 20.years.ago
      user = users(:one)
      user.update(birthday:)
      result = CheckUserEligibilty.call(user:)
      assert result.success?
    end

    test "underage" do
      birthday = 12.years.ago
      user = users(:one)
      user.update(birthday:)
      result = CheckUserEligibilty.call(user:)
      assert result.failure?
      assert_equal "underage", result.message
    end
  end
end
