# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/contracts_mailer
class ContractsMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/contracts_mailer/approved
  def approved
    ContractsMailer.approved Contract.approved.last
  end
end
