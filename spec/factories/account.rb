FactoryBot.define do
    factory :account, class: 'Account' do
        name { 'test-account' }
        ledger { create(:ledger) }
    end
end