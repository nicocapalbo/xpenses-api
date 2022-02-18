FactoryBot.define do
    factory :subcategory, class: 'Subcategory' do
        sequence(:name) { |x| "test-subcategory-#{x}"}
        category { create(:category) }
    end
end