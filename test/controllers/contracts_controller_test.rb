require "test_helper"

class ContractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract = contracts(:one)
    @user = @contract.user
  end

  test "should get new" do
    get new_user_contract_url(@user)
    assert_response :success
  end

  test "should create contract" do
    assert_difference("Contract.count") do
      post user_contracts_url(users(:two)), params: { contract: { content: @contract.content, title: @contract.title } }
    end

    assert_redirected_to user_contract_url(users(:two), Contract.last)
  end

  test "should show contract" do
    get user_contract_url(@user, @contract)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_contract_url(@user, @contract)
    assert_response :success
  end

  test "should update contract" do
    patch user_contract_url(@user, @contract), params: { contract: { content: @contract.content, title: @contract.title } }
    assert_redirected_to user_contract_url(@user, @contract)
  end

  test "should destroy contract" do
    assert_difference("Contract.count", -1) do
      delete user_contract_url(@user, @contract)
    end

    assert_redirected_to user_url(@user)
  end
end
