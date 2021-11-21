class LedgersController < ApplicationController
  def index
    @ledgers = Ledger.all
    render json: @ledgers
  end

  # def new
  #   @ledger = Ledger.new
  # end

  # def create
  #   @ledger = current_user.ledgers.new(ledger_params)
  #   if @ledger.save!
  #     redirect_to ledger_path(@ledger)
  #   else
  #     render :new
  #   end
  # end

  # private

  # def ledger_params
  #   params.require(:ledger).permit(:name, :description)
  # end
end
