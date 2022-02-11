class LedgersController < ApplicationController
  include Secured
  def index
    @ledgers = Ledger.all
    render json: { ledgers: @ledgers, user: current_user }
  end

  def create
    @ledger = Ledger.new(ledger_params)
    return unless @ledger.save!
  end

  private

  def ledger_params
    params.require(:ledger).permit(:name, :description)
  end
end
