# frozen_string_literal: true

module Admin
  module Contracts
    class ApprovalsController < ApplicationController
      before_action :set_contract

      def update
        result = ::Contracts::ApproveContract.call(contract: @contract, user: @contract.user)

        if result.success?
          flash[:notice] = "Contract approved"
        else
          flash[:error] = result.message
        end

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
