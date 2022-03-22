# frozen_string_literal: true

module Contracts
  class SignatureInput < Upgrow::Input
    attr_accessor :verification_code

    validates :verification_code, presence: true, format: { with: /\A\d{6}\z/, message: "[%<value>s] is not a 6 digit code" }
  end
end
