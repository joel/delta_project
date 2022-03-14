# frozen_string_literal: true

require "test_helper"

class ContractsMailerTest < ActionMailer::TestCase
  test "approved" do
    mail = ContractsMailer.approved(contracts(:approved))
    assert_equal "Contract Approved!", mail.subject
    assert_equal [contracts(:approved).user.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "you contract was approved!", mail.body.encoded
  end
end
