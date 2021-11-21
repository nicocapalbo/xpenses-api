class Category < ApplicationRecord
  belongs_to :ledger
  has_many :subcategories
  has_many :transactions, through: :subcategories
  validates :ledger, :name, presence: true
  validates :name, length: { in: 4..20 }

  def category_total
    category_expense = Subcategory.where(category: self).left_outer_joins(:transactions).where(transactions: { cleared: true, ttype: true }).where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).sum(:value)
    category_income = Subcategory.where(category: self).left_outer_joins(:transactions).where(transactions: { cleared: true, ttype: false }).where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).sum(:value)
    ((category_income - category_expense) *  -1 )
  end

  # def category_total_income
  #   Category.joins(subcategories: :transactions).where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).sum(:deposit)
  # end

  def self.month_total_expense
    Category.joins(subcategories: :transactions).where(transactions: { ttype: true }).where('date >= ? and date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).sum(:value)
  end
end
