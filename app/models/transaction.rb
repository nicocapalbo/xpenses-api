class Transaction < ApplicationRecord
  belongs_to :ledger
  belongs_to :account
  belongs_to :subcategory
  validates :ledger, :account, :info, :subcategory, presence: true
  validates :info, length: { in: 4..20 }
  # validates :payment, presence: true, unless: ->(transaction) { transaction.deposit.present? }
  # validates :deposit, presence: true, unless: ->(transaction) { transaction.payment.present? }
  # validates :payment, :deposit, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  # validate :pay_or_deposit?

  def self.month_top_transactions
    date = Date.today
    Transaction.where('date >= ? and date <= ?', date.beginning_of_month,date.end_of_month).where(ttype: true).order(date: :desc).first(5)
  end
end
