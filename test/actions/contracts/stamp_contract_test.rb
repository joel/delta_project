# frozen_string_literal: true

require "test_helper"

module Contracts
  class StampContractTest < ActiveSupport::TestCase
    test "stamp" do
      contract = contracts(:pending_approval)
      ctx = { contract: }
      freeze_time do
        assert_changes -> { contract.approved_at }, from: nil, to: Time.current do
          result = StampContract.call(ctx)
          assert result.success?
          assert_equal result[:contract], contract
        end
      end
    end
  end
end
