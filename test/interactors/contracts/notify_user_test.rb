# frozen_string_literal: true

require "test_helper"

module Contracts
  class NotifyUserTest < ActionDispatch::IntegrationTest
    test "approved" do
      # Asserts the difference in the ActionMailer::Base.deliveries
      assert_emails 1 do
        NotifyUser.call(contract: contracts(:approved))
      end
      assert_equal "Contract Approved!", ActionMailer::Base.deliveries.last.subject
    end

    test "rejected" do
      # Asserts the difference in the ActionMailer::Base.deliveries
      assert_emails 1 do
        NotifyUser.call(contract: contracts(:pending_approval))
      end
      assert_equal "Contract Rejected!", ActionMailer::Base.deliveries.last.subject
    end
  end
end
