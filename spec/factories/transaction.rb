FactoryBot.define do
    factory :transaction, class: 'Transaction' do
        sequence(:name) { |x| "test-transaction-#{x}"}
        ledger { create(:ledger) }
        account { create(:account) }
        date { Date.today }
        info { 'test info' }
        subcategory { create(:subcategory) }
        ttype { true }
        value { rand(1..2500) }
        cleared { false }
    end
end