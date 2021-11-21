class AccountsController < ApplicationController
  # before_action :set_ledger, only: [:index, :create]
  # def index
  #   @accounts = Account.where(ledger: @ledger)
  #   @account = Account.new
  #   @total_info = {
  #     total_cleared: total_cleared,
  #     total_balance: total_balance,
  #     diff: diff(total_balance, total_cleared),
  #     diff_percentage: diff_percentage(total_balance, total_cleared)
  #   }
  # end

  # def create
  #   @account = Account.new(account_params)
  #   @account.ledger = @ledger
  #   if @account.save
  #     redirect_to ledger_path(@ledger)
  #   else
  #     render :index
  #   end
  # end

  # private

  # def set_ledger
  #   @ledger = Ledger.find_by(id: params[:ledger_id])
  # end

  # def account_params
  #   params.require(:account).permit(:name)
  # end

  # def diff(balance, cleared)
  #   balance - cleared
  # end

  # def diff_percentage(balance, cleared)
  #   (1 - (balance / cleared)) * 100
  # end

  # def total_cleared
  #   @ledger.ledger_cleared_deposit - @ledger.ledger_cleared_payment
  # end

  # def total_balance
  #   @ledger.ledger_balanced_deposit - @ledger.ledger_balanced_payment
  # end
end
