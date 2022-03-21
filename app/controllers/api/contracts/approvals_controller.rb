# frozen_string_literal: true

module Api
  module Contracts
    class ApprovalsController < Api::BaseController
      before_action :set_contract

      def update
        result = ::Contracts::ApproveContract.call({ contract: @contract, user: @contract.user })

        if result.success?
          render json: @contract
        else
          render json: { error: result[:message] }, status: :unprocessable_entity
        end
      end

      def destroy
        if @contract.update(approved_at: nil)
          render json: @contract
        else
          render json: { error: @contract.errors }, status: :unprocessable_entity
        end
      end

      private

      def set_contract
        @contract = Contract.find(params[:id])
      end
    end
  end
end
