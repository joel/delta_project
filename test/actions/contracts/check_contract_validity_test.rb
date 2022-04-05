# frozen_string_literal: true

require "test_helper"

module Contracts
  class CheckContractValidityTest < ActiveSupport::TestCase
    test "happy path" do
      contract = contract_with_document(contracts(:pending_approval))
      adult!(contract.user)

      ctx = { contract: }

      result = CheckContractValidity.call(ctx)
      assert result.success?
      assert_equal result[:contract], contract
    end

    test "missing document" do
      contract = contracts(:pending_approval)
      adult!(contract.user)

      ctx = { contract: }

      result = CheckContractValidity.call(ctx)
      assert result.failure?
      assert_equal "missing document", result[:message]
    end
  end
end
