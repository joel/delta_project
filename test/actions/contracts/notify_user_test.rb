# frozen_string_literal: true

require "test_helper"

module Contracts
  class NotifyUserTest < ActionDispatch::IntegrationTest
    test "approved" do
      # Asserts the difference in the ActionMailer::Base.deliveries
      contract = contracts(:approved)
      ctx = { contract: }
      result = nil
      assert_emails 1 do
        result = NotifyUser.call(ctx)
      end
      assert result.success?
      assert_equal result[:contract], contract
      assert_equal "Contract Approved!", ActionMailer::Base.deliveries.last.subject
    end

    test "rejected" do
      # Asserts the difference in the ActionMailer::Base.deliveries
      contract = contracts(:pending_approval)
      ctx = { contract: }
      result = nil
      assert_emails 1 do
        result = NotifyUser.call(ctx)
      end
      assert result.success?
      assert_equal result[:contract], contract
      assert_equal "Contract Rejected!", ActionMailer::Base.deliveries.last.subject
    end
  end
end
