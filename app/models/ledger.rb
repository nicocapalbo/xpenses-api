class Ledger < ApplicationRecord
  has_many :accounts
  has_many :categories
  has_many :subcategories, through: :categories
  has_many :transactions
  validates :name, :description, presence: true
  validates :name, :description, length: { in: 4..20 }

  def ledger_cleared_deposit
    self.transactions.where(cleared: true, ttype: false).sum(:value)
  end

  def ledger_cleared_payment
    self.transactions.where(cleared: true, ttype: true).sum(:value)
  end

  def ledger_cleared_month_deposit
    self.transactions.where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).where(cleared: true, ttype: false).sum(:value)
  end

  def ledger_cleared_month_payment
    self.transactions.where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).where(cleared: true, ttype: true).sum(:value)
  end

  def ledger_balanced_deposit
    self.transactions.where(ttype: false).sum(:value)
  end

  def ledger_balanced_payment
    self.transactions.where(ttype: true).sum(:value)
  end

  def ledger_balanced_month_deposit
    self.transactions.where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).where(ttype: false).sum(:value)
  end

  def ledger_balanced_month_payment
    self.transactions.where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).where(ttype: true).sum(:value)
  end
end
