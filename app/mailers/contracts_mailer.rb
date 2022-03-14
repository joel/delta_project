# frozen_string_literal: true

class ContractsMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contracts_mailer.approved.subject
  #
  def approved(contract)
    @contract = contract
    @user = contract.user

    mail to: @user.email, subject: "Contract Approved!"
  end

  def rejected(contract)
    @contract = contract
    @user = contract.user

    mail to: @user.email, subject: "Contract Rejected!"
  end
end
