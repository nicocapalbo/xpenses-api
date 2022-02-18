require 'rails_helper'

RSpec.describe Subcategory, type: :model do

    describe 'validations' do
        let(:category) { create(:category) }
        let(:subcategory) { create(:subcategory, category: category) }
        subject { subcategory }
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:category) }
        it { is_expected.to be_valid }
    
        context 'not valid length in name' do
            let(:subcategory) do 
                create(:subcategory, name: 'a' * 25)
            end
            it do
                expect{ subject }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Name is too long (maximum is 20 characters)')
            end
        end

        context 'with no category created' do
            let(:subcategory) do 
                create(:subcategory, category: nil)
            end
            it do
                expect { subject }. to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Category must exist, Category can't be blank")
            end
        end
    end
    
    describe 'associations' do
        it { should belong_to(:category) }
        it { should have_many(:transactions) }
    end

    describe 'index' do
        it { should have_db_index(:category_id) }
    end
end