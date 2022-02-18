FactoryBot.define do
    factory :ledger, class: 'Ledger' do
        name { 'test-ledger' }
        description { 'test description' }
    end
end