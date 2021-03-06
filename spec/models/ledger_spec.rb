# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ledger, type: :model do
  describe 'validations' do
    let(:ledger) { create(:ledger) }
    subject { ledger }
    it { should validate_presence_of(:uuid) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { is_expected.to be_valid }

    context 'presence of UUID' do
      let(:ledger) do
        create(:ledger, uuid: 'google-oauth2|107132543669876578277')
      end
      it do
        expect do
          subject
        end.to raise_error(ActiveRecord::RecordInvalid,
                           'Validation failed: Name is too long (maximum is 20 characters)')
      end
    end

    context 'not valid length in name' do
      let(:ledger) do
        create(:ledger, name: 'a' * 3)
      end
      it do
        expect do
          subject
        end.to raise_error(ActiveRecord::RecordInvalid,
                           'Validation failed: Name is too long (maximum is 20 characters)')
      end
    end

    context 'not valid length in description' do
      let(:ledger) do
        create(:ledger, description: 'a' * 3)
      end
      it do
        expect do
          subject
        end.to raise_error(ActiveRecord::RecordInvalid,
                           'Validation failed: Description is too long (maximum is 20 characters)')
      end
    end
  end

  describe 'associations' do
    it { should have_many(:accounts) }
    it { should have_many(:categories) }
    it { should have_many(:subcategories) }
    it { should have_many(:transactions) }
  end

  context do
    let(:ledger) { create(:ledger) }
    let!(:transaction) { create(:transaction, ledger: ledger, cleared: true, ttype: false) }
    context 'with ttype false' do
      describe '#ledger_cleared_deposit' do
        it 'should return the correct value' do
          expect(ledger.ledger_cleared_deposit).to eq(transaction.value)
        end
      end
      describe '#ledger_balanced_deposit' do
        it 'should return the correct value' do
          expect(ledger.ledger_balanced_deposit).to eq(transaction.value)
        end
      end

      describe '#ledger_balanced_month_deposit' do
        it 'should return the correct value' do
          expect(ledger.ledger_balanced_month_deposit).to eq(transaction.value)
        end
      end

      describe '#ledger_cleared_month_deposit' do
        it 'should return the correct value' do
          expect(ledger.ledger_cleared_month_deposit).to eq(transaction.value)
        end
      end
    end
    context 'with ttype true' do
      before do
        transaction.update!(ttype: true)
      end

      describe '#ledger_cleared_payment' do
        it 'should return the correct value' do
          expect(ledger.ledger_cleared_payment).to eq(transaction.value)
        end
      end
      describe '#ledger_cleared_month_payment' do
        it 'should return the correct value' do
          expect(ledger.ledger_cleared_month_payment).to eq(transaction.value)
        end
      end
      describe '#ledger_balanced_payment' do
        it 'should return the correct value' do
          expect(ledger.ledger_balanced_payment).to eq(transaction.value)
        end
      end
      describe '#ledger_balanced_month_payment' do
        it 'should return the correct value' do
          expect(ledger.ledger_balanced_month_payment).to eq(transaction.value)
        end
      end
    end
  end
end
