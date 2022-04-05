# frozen_string_literal: true

require "test_helper"

module Contracts
  class CheckUserEligibiltyTest < ActiveSupport::TestCase
    test "happy path" do
      user = users(:one)
      adult!(user)
      result = CheckUserEligibilty.execute(user:)
      assert result.success?
    end

    test "underage" do
      user = users(:one)
      underage!(user)
      result = CheckUserEligibilty.execute(user:)
      assert result.failure?
      assert_equal "underage", result.message
    end
  end
end
