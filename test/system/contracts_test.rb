require "application_system_test_case"

class ContractsTest < ApplicationSystemTestCase
  setup do
    @contract = contracts(:one)
    @user = @contract.user
  end

  test "should create contract" do
    visit user_url(users(:two))
    click_on "New contract"

    fill_in "Content", with: @contract.content
    fill_in "Title", with: @contract.title

    click_on "Create Contract"

    assert_text "Contract was successfully created"

    click_on "Back"
  end

  test "should update Contract" do
    visit user_contract_url(@user, @contract)
    click_on "Edit this contract", match: :first

    fill_in "Content", with: @contract.content
    fill_in "Title", with: @contract.title

    click_on "Update Contract"

    assert_text "Contract was successfully updated"

    click_on "Back"
  end

  test "should destroy Contract" do
    visit user_contract_url(@user, @contract)
    click_on "Destroy this contract", match: :first

    assert_text "Contract was successfully destroyed"
  end
end
