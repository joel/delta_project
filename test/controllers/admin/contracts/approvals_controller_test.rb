# frozen_string_literal: true

require "test_helper"

module Admin
  module Contracts
    class ApprovalsControllerTest < ActionDispatch::IntegrationTest
      test "should approve the contract" do
        put admin_contracts_approval_url(contracts(:two))
        assert_redirected_to admin_users_url
      end

      test "should reject the contract" do
        delete admin_contracts_approval_url(contracts(:two))
        assert_redirected_to admin_users_url
      end
    end
  end
end
