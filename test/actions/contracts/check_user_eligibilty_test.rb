# frozen_string_literal: true

require "test_helper"

module Contracts
  class CheckUserEligibiltyTest < ActiveSupport::TestCase
    test "happy path" do
      user = users(:one)
      adult!(user)

      ctx = { user: }

      result = CheckUserEligibilty.call(ctx)

      assert result.success?
      assert_equal result[:user], user
    end

    test "underage" do
      user = users(:one)
      underage!(user)

      ctx = { user: }

      result = CheckUserEligibilty.call(ctx)

      assert result.failure?
      assert_equal "underage", result[:message]
    end
  end
end
