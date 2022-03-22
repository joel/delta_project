# frozen_string_literal: true

require "test_helper"

module Admin
  module Contracts
    class SignaturesControllerTest < ActionDispatch::IntegrationTest
      test "should signed the contract" do
        patch admin_contracts_signature_url(contracts(:two))
        assert_redirected_to admin_users_url
      end

      test "should unsigned the contract" do
        delete admin_contracts_signature_url(contracts(:two))
        assert_redirected_to admin_users_url
      end
    end
  end
end
