# frozen_string_literal: true

module Api
  module Contracts
    class SignaturesController < Api::BaseController
      before_action :set_contract

      def update
        if Contract.verification_code_valid?(verification_code)
          @contract.update(signed_at: Time.now)
          render json: @contract
        else
          render json: { error: "bad verification code" }, status: :unprocessable_entity
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
