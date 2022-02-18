FactoryBot.define do
    factory :account, class: 'Account' do
        sequence(:name) { |x| "tacc#{x}" }
        ledger { create(:ledger) }
    end
end