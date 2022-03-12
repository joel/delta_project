# frozen_string_literal: true

require "test_helper"

module Api
  module Contracts
    class ApprovalsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @contract = contracts(:one)
      end

      test "should get approved the contract" do
        freeze_time do
          patch api_contracts_approval_url(id: contracts(:pending_approval))
          assert_response :success
          assert_equal Time.current, response.parsed_body["approved_at"]
        end
      end

      test "should get remove approval to the contract" do
        delete api_contracts_approval_url(id: contracts(:approved))
        assert_response :success
        assert_nil response.parsed_body["approved_at"]
      end
    end
  end
end
