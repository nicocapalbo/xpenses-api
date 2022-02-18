FactoryBot.define do
    factory :transaction, class: 'Transaction' do
        ledger { create(:ledger) }
        account { create(:account) }
        date { Date.today }
        info { 'test info' }
        subcategory { create(:subcategory) }
        ttype { true }
        value { 100 }
        cleared { false }
    end
end