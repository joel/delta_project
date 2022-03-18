# frozen_string_literal: true

require "test_helper"

module Contracts
  class ApproveContractTest < ActiveSupport::TestCase
    test "happy path" do
      contract = contract_with_document(contracts(:pending_approval))
      adult!(contract.user)

      result = ApproveContract.new.perform(contract)
      assert result.errors.none?
      assert_equal result.user, contract.user
    end
  end
end
