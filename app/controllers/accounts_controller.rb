class AccountsController < ApplicationController
  before_action :set_ledger, only: [:index, :create]

  def index
    @accounts = Account.where(ledger: @ledger)
    @total_info = {
      total_cleared: total_cleared,
      total_balance: total_balance,
      diff: diff(total_balance, total_cleared),
      diff_percentage: diff_percentage(total_balance, total_cleared)
    }
    render json: { accounts: @accounts, totals: @total_info }
  end

  def create
    @account = Account.new(account_params)
    @account.ledger = @ledger
    render json: @account if @account.save
  end

  private

  def set_ledger
    @ledger = Ledger.find_by(id: params[:ledger_id])
    render_fail('Ledger not found / Ledger must exist', :bad_request) unless @ledger
  end

  def account_params
    params.require(:account).permit(:name)
  end

  def diff(balance, cleared)
    balance - cleared
  end

  def diff_percentage(balance, cleared)
    (1 - (balance / cleared)) * 100
  end

  def total_cleared
    @ledger.ledger_cleared_deposit - @ledger.ledger_cleared_payment
  end

  def total_balance
    @ledger.ledger_balanced_deposit - @ledger.ledger_balanced_payment
  end
end
