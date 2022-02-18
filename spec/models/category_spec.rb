require 'rails_helper'

RSpec.describe Category, type: :model do

    describe 'validations' do
        let(:ledger) { create(:ledger) }
        let(:category) { create(:category, ledger: ledger)}
        subject { category }
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:ledger) }
        it { is_expected.to be_valid }
    
        context 'not valid length in name' do
            let(:category) do 
                create(:category, name: 'a' * 25)
            end
            it do
                expect{ subject }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Name is too long (maximum is 20 characters)')
            end
        end

        context 'with no ledger created' do
            let(:category) do 
                create(:category, ledger: nil)
            end
            it do
                expect { subject }. to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Ledger must exist, Ledger can't be blank")
            end
        end
    end
    
    describe 'associations' do
        it { should belong_to(:ledger) }
        it { should have_many(:transactions) }
        it { should have_many(:subcategories) }
    end

    describe 'index' do
        it { should have_db_index(:ledger_id) }
    end
end