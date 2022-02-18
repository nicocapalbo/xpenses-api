class TransactionSerializer < ActiveModel::Serializer
  attributes :info, :value, :date, :cleared, :ttype
  belongs_to :account
end
