class TransactionsController < ApplicationController
  before_action :set_ledger, only: [:index, :create, :update]

  def index
    @transactions = Transaction.where(ledger: @ledger).order(date: :desc)
    render json: @transactions
  end

  def create
    @transaction = Transaction.new(transaction_params)
    # @ledger = params[:transaction][:ledger_id].to_i
    return unless @transaction.save
  end

  private

  def set_ledger
    @ledger = Ledger.find_by(id: params[:ledger_id])
  end

  def transaction_params
    params.require(:transaction).permit(:ledger_id, :account_id, :date, :info, :subcategory_id, :cleared, :ttype, :value)
  end
end
