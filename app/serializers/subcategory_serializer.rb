class SubcategorySerializer < ActiveModel::Serializer
  attributes :name
  has_many :transactions
end
