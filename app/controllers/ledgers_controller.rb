class LedgersController < ApplicationController
  include Secured
  def index
    @ledger = Ledger.find_by(uuid: current_user)
    render json: { ledgers: @ledger, user: current_user }
  end

  # def show
  #   @ledger = Ledger.find(uuid: current_user)
  #   render json: { ledger: @ledger, user: current_user }
  # end

  def create
    @ledger = Ledger.new(ledger_params)
    @ledger.uuid = current_user
    return unless @ledger.save!
    render json: @ledger if @ledger.save
  end

  private

  def ledger_params
    params.require(:ledger).permit(:name, :description)
  end
end
