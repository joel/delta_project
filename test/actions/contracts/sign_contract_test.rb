# frozen_string_literal: true

require "test_helper"

module Contracts
  class SignContractTest < ActiveSupport::TestCase
    test "happy path" do
      contract = contract_with_document(contracts(:pending_signature))
      adult!(contract.user)

      input = SignatureInput.new(verification_code: "123456")

      result = SignContract.new.perform(contract:, input:)
      assert result.errors.none?
      assert_equal result.contract, contract
    end

    test "underage" do
      contract = contract_with_document(contracts(:pending_signature))
      adult!(contract.user)

      input = SignatureInput.new(verification_code: "1F3456")

      result = SignContract.new.perform(contract:, input:)
      assert result.errors.any?
      assert_equal({ verification_code: ["[1F3456] is not a 6 digit code"] }, result.errors.messages)
    end
  end
end
