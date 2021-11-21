class DashboardController < ApplicationController
  before_action :set_ledger, only: [:index, :create]

  def index
    @accounts = Account.where(ledger: @ledger)
    # @categories = categories_total
    # @month_total_expense = month_total_expense
    # @top_transactions = top_transactions
    # @data_keys = chart_data_keys
    # @data_values = chart_data_values
    render json: { account: @accounts, attr: '' }
  end

  private

  # def month_total_expense
  #   Category.month_total_expense
  # end

  # def top_transactions
  #   Transaction.month_top_transactions
  # end

  # def categories_total
  #   categories = []
  #   Category.all.each do |category|
  #     categories << {
  #       category_name: category.name,
  #       category_total: category.category_total
  #     }
  #   end
  #   categories
  # end

  # def chart_data_keys
  #   data_keys = []
  #   @categories.each { |category| data_keys << category[:category_name] }
  #   data_keys
  # end

  # def chart_data_values
  #   data_values = []
  #   @categories.each { |category| data_values << (category[:category_total] / @month_total_expense) }
  #   data_values
  # end

  def set_ledger
    @ledger = Ledger.find_by(id: params[:ledger_id])
  end
end
