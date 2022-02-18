FactoryBot.define do
    factory :category, class: 'Category' do
        sequence(:name) { |x| "test-category-#{x}"}
        ledger { create(:ledger) }
    end
end