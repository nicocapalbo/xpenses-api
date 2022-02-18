class LedgerSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :accounts, :categories, :subcategories, :transactions
end
