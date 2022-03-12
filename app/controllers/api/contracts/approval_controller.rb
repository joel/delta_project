class Api::Contracts::ApprovalController < Api::BaseController
  before_action :set_contract

  def create
    @contract.update(approved_at: Time.now)
    render json: @contract
  end

  def destroy
    @contract.update(approved_at: nil)
    render json: @contract
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end
end
