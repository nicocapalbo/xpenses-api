class LedgersController < ApplicationController
  def index
    @ledgers = Ledger.all
    render json: @ledgers
  end

  def create
    @ledger = Ledger.new(ledger_params)
    render json: @ledger if @ledger.save
  end

  private

  def ledger_params
    params.require(:ledger).permit(:name, :description)
  end
end
