# frozen_string_literal: true

require "test_helper"

module Contracts
  class CheckUserEligibiltyTest < ActiveSupport::TestCase
    test "happy path" do
      user = users(:one)
      adult!(user)
      result = CheckUserEligibilty.new.perform(user)
      assert result.errors.none?
      assert_equal result.user, user
    end

    test "underage" do
      user = users(:one)
      underage!(user)
      result = CheckUserEligibilty.new.perform(user)
      assert result.errors.any?
      assert_equal "underage", result.errors[:detail]
    end
  end
end
