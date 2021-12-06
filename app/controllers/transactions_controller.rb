class TransactionsController < ApplicationController
  before_action :set_ledger, only: [:index, :create, :update]

  def index
    @transactions = Transaction.where(ledger: @ledger).order(date: :desc)
    render json: @transactions
  end

  def create
    params_object = transaction_params
    if params_object[:subscription][:duePayments] != 0 && params_object[:subscription][:subscription] == false
      @subscription = Subscription.new(params_object[:transaction].merge(params_object[:subscription]))
      @subscription.installments -= 1
    elsif params_object[:subscription][:installments].zero? && params_object[:subscription][:subscription]
      @subscription = Subscription.new(params_object[:transaction].merge(params_object[:subscription]))
    end
    @transaction = Transaction.new(params_object[:transaction])
    return unless @transaction.save && @subscription.save
  end

  private

  def set_ledger
    @ledger = Ledger.find_by(id: params[:ledger_id])
  end

  def transaction_params
    transaction_params, subscription_params = params.require([:transaction, :subscription])
    {
      transaction: transaction_params.permit(:ledger_id, :account_id, :date, :info, :subcategory_id, :cleared, :ttype, :value),
      subscription: subscription_params.permit(:installments, :subscription)
    }
  end
end
