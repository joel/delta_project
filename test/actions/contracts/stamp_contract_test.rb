# frozen_string_literal: true

require "test_helper"

module Contracts
  class StampContractTest < ActiveSupport::TestCase
    test "stamp" do
      contract = contracts(:pending_approval)
      freeze_time do
        assert_changes -> { contract.approved_at }, from: nil, to: Time.current do
          result = StampContract.new.perform(contract)
          assert result.errors.none?
          assert_equal result.contract, contract
        end
      end
    end
  end
end
