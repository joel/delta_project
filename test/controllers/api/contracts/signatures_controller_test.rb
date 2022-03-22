# frozen_string_literal: true

require "test_helper"

module Api
  module Contracts
    class SignaturesControllerTest < ActionDispatch::IntegrationTest
      setup do
        @contract = contracts(:one)
      end

      test "should signed the contract" do
        freeze_time do
          patch api_contracts_signature_url(id: contracts(:pending_signature)), params: { signature: { verification_code: "872604" } }
          assert_response :success
          assert_equal Time.current, response.parsed_body["signed_at"]
        end
      end
    end
  end
end
