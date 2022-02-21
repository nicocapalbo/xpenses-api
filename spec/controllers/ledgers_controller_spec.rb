require 'rails_helper'

RSpec.describe LedgersController, type: :controller do
  let!(:ledger) { create(:ledger) }
  let(:payload) { JSON.parse(response.body).symbolize_keys }

  describe '#index' do
    subject(:index_request) {
      get :index
    }

    context 'when the response is successful' do
      it 'has status success' do
        expect(index_request).to have_http_status(:success)
      end

      it 'returns a collection of ledgers' do
        index_request
        expect(payload[:ledgers].size).to eq(1)
      end
    end
  end

  describe '#create' do
    let(:ledger_params) do
      {
        ledger: {
          name: 'test',
          description: 'test-desc'
        }
      }
    end
    subject(:create_request) {
      post :create, params: ledger_params
    }

    context 'when the response is successful' do
      it 'has status success' do
        expect(create_request).to have_http_status(:success)
      end

      it 'returns the created ledger' do
        create_request
        expect(payload.size).to eq(1)
      end
    end
  end
end
