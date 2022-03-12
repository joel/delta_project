require "test_helper"

class Api::Contracts::ApprovalControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract = contracts(:one)
  end

  test "should get approved the contract" do
    freeze_time do
      get api_contracts_approval_create_url(id: contracts(:pending_approval))
      assert_response :success
      assert_equal Time.current, response.parsed_body["approved_at"]
    end
  end

  test "should get remove approval to the contract" do
    get api_contracts_approval_destroy_url(id: contracts(:approved))
    assert_response :success
    assert_nil response.parsed_body["approved_at"]
  end
end
