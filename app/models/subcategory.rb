class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :transactions
  validates :category, :name, presence: true
  validates :name, length: { in: 4..20 }
end
