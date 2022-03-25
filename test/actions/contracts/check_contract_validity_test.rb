# frozen_string_literal: true

require "test_helper"

module Contracts
  class CheckContractValidityTest < ActiveSupport::TestCase
    test "happy path" do
      contract = contract_with_document(contracts(:pending_approval))
      adult!(contract.user)

      result = CheckContractValidity.new.perform(contract)
      assert result.errors.none?
      assert_equal result.contract, contract
    end

    test "missing document" do
      contract = contracts(:pending_approval)
      adult!(contract.user)

      result = CheckContractValidity.new.perform(contract)
      assert result.errors.any?
      assert_equal "missing document", result.errors[:detail]
    end
  end
end
