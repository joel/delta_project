# frozen_string_literal: true

module Api
  module Contracts
    class SignaturesController < Api::BaseController
      before_action :set_contract

      def update
        input  = ::Contracts::SignatureInput.new(verification_code)
        result = ::Contracts::SignContract.new.perform(contract: @contract, input:)

        if result.errors.none?
          render json: @contract
        else
          render json: { error: result.errors.messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @contract.update(signed_at: nil)
          render json: @contract
        else
          render json: { error: @contract.errors }, status: :unprocessable_entity
        end
      end

      private

      def verification_code
        params.require(:signature).permit(:verification_code)
      end

      def set_contract
        @contract = Contract.find(params[:id])
      end
    end
  end
end
