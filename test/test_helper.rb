# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ContractHelper
  def contract_with_document(contract)
    contract.document.attach(Rack::Test::UploadedFile.new(
                               file_fixture("contract_document.txt")
                             ))
    contract
  end
end

module UserHelper
  def adult!(user)
    user.update(birthday: 20.years.ago)
    user
  end

  def underage!(user)
    user.update(birthday: 15.years.ago)
    user
  end
end

module ActiveSupport
  class TestCase
    include ContractHelper
    include UserHelper

    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
