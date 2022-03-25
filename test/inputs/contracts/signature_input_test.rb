# frozen_string_literal: true

require_relative "../../test_helper"

module Contracts
  class SignatureInputTest < ActiveSupport::TestCase
    test "should be valid with a valid verification code" do
      params = {
        verification_code: "123456"
      }
      input = SignatureInput.new(params)
      assert input.valid?
      assert_equal "123456", input.verification_code
    end

    test "should not be valid with an erroned verification code" do
      params = {
        verification_code: "F23D56"
      }
      input = SignatureInput.new(params)
      assert_not input.valid?
      assert_equal ["[F23D56] is not a 6 digit code"], input.errors.messages[:verification_code]
    end
  end
end
