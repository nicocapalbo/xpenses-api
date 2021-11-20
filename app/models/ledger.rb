class Ledger < ApplicationRecord
  has_many :accounts
  has_many :categories
  has_many :subcategories, through: :categories
  has_many :transactions
  validates :name, :description, presence: true
  validates :name, :description, length: { in: 4..20 }

  def ledger_cleared_deposit
    self.transactions.where(cleared: true).sum(:deposit)
  end

  def ledger_cleared_payment
    self.transactions.where(cleared: true).sum(:payment)
  end

  def ledger_cleared_month_deposit
    self.transactions.where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).where(cleared: true).sum(:deposit)
  end

  def ledger_cleared_month_payment
    self.transactions.where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).where(cleared: true).sum(:payment)
  end

  def ledger_balanced_deposit
    self.transactions.sum(:deposit)
  end

  def ledger_balanced_payment
    self.transactions.sum(:payment)
  end

  def ledger_balanced_month_deposit
    self.transactions.where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).sum(:deposit)
  end

  def ledger_balanced_month_payment
    self.transactions.where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).sum(:payment)
  end
end
