# frozen_string_literal: true

require "test_helper"

module Contracts
  class ApproveContractTest < ActiveSupport::TestCase
    test "happy path" do
      contract = contract_with_document(contracts(:pending_approval))
      adult!(contract.user)

      ctx = { user: contract.user, contract: }
      result = ApproveContract.call(ctx)
      assert result.success?
      assert_equal result[:user], contract.user
      assert_equal result[:contract], contract
    end
  end
end
