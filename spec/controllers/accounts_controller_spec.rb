require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let!(:account) { create(:account) }
  let(:payload) { JSON.parse(response.body).symbolize_keys }

  describe 'GET ledgers/ledger_id/accounts' do
    subject(:index_request) {
      get :index, params: { ledger_id: account.ledger.id }
    }

    context 'when the response is successful' do
      it 'has status success' do
        expect(index_request).to have_http_status(:success)
      end

      it 'returns a collection of accounts' do
        index_request
        expect(payload[:accounts].size).to eq(1)
      end
    end

    context 'when the response is unsuccessful' do
      context 'with invalid ledger_id' do
        subject(:index_request) {
          get :index, params: { ledger_id: 10 }
        }

        it 'should return a bad request' do
          expect(index_request).to have_http_status(:bad_request)
        end
      end
    end
  end

  describe 'POST ledgers/ledger_id/accounts' do
    let(:account_params) do
      {
        ledger_id: account.ledger.id,
        account: {
          name: 'test'
        }
      }
    end
    subject(:create_request) {
      post :create, params: account_params
    }

    context 'when the response is successful' do
      it 'has status success' do
        expect(create_request).to have_http_status(:success)
      end

      it 'creates an account and returns the created account' do
        create_request
        expect(payload.size).to eq(1)
        expect(payload[:account]['name']).to eq('test')
      end
    end

    context 'when the response is unsuccessful' do
      context 'when invalid Ledger' do
        let(:account_params) do
          {
            ledger_id: 10,
            account: {
              name: 'test'
            }
          }
        end

        it 'should return a bad request' do
          expect(create_request).to have_http_status(:bad_request)
        end
      end
    end
  end
end
