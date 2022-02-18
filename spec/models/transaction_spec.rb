require 'rails_helper'

RSpec.describe Transaction, type: :model do

    describe 'validations' do
        let(:transaction) { create(:transaction) }
        subject { transaction }
        it { should validate_presence_of(:ledger) }
        it { should validate_presence_of(:info) }
        it { should validate_presence_of(:subcategory) }
        it { should validate_presence_of(:account) }
        it { is_expected.to be_valid }
    
        context 'not valid length in info' do
            let(:transaction) do 
                create(:transaction, info: 'a' * 25)
            end
            it do
                expect{ subject }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Info is too long (maximum is 20 characters)')
            end
        end

        context 'with no ledger created' do
            let(:transaction) do 
                create(:transaction, ledger: nil)
            end
            it do
                expect { subject }. to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Ledger must exist, Ledger can't be blank")
            end
        end
        context 'with no account created' do
            let(:transaction) do 
                create(:transaction, account: nil)
            end
            it do
                expect { subject }. to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Account must exist, Account can't be blank")
            end
        end
        context 'with no subcategory created' do
            let(:transaction) do 
                create(:transaction, subcategory: nil)
            end
            it do
                expect { subject }. to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Subcategory must exist, Subcategory can't be blank")
            end
        end
    end
    
    describe 'associations' do
        it { should belong_to(:ledger) }
        it { should belong_to(:account) }
        it { should belong_to(:subcategory) }
    end

    describe 'index' do
        it { should have_db_index(:ledger_id) }
        it { should have_db_index(:account_id) }
        it { should have_db_index(:subcategory_id) }
    end
end