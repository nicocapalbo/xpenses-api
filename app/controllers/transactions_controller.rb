class TransactionsController < ApplicationController
  # before_action :set_ledger, only: [:index, :create]

  # def index
  #   @transactions = Transaction.where(ledger: @ledger).order(date: :desc)
  #   @transaction = Transaction.new
  # end

  # def create
  #   @transaction = Transaction.new(transaction_params)
  #   @ledger = params[:transaction][:ledger_id].to_i
  #   if @transaction.save!
  #     redirect_to ledger_dashboard_index_path(@ledger)
  #   end
  # end

  # private

  # def set_ledger
  #   @ledger = Ledger.find_by(id: params[:ledger_id])
  # end

  # def transaction_params
  #   params.require(:transaction).permit(:ledger_id, :account_id, :date, :info, :subcategory_id, :cleared, :payment, :deposit)
  # end
end
