# frozen_string_literal: true

module Admin
  module Contracts
    class ApprovalsController < ApplicationController
      before_action :set_contract

      def update
        @contract.update(approved_at: Time.now)
        redirect_to admin_users_path
      end

      def destroy
        @contract.update(approved_at: nil)
        redirect_to admin_users_path
      end

      private

      def set_contract
        @contract = Contract.find(params[:id])
      end
    end
  end
end
