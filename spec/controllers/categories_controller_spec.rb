require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
    let!(:category) { create(:category) }
    let(:payload) { JSON.parse(response.body).symbolize_keys }

    describe '#index' do
        subject(:index_request) {
          get :index, params: { ledger_id: category.ledger.id }
        }
    
        context 'when the response is successful' do
          it 'has status success' do
            expect(index_request).to have_http_status(:success)
          end
    
          it 'returns a collection of categories' do
            index_request
            expect(payload[:categories].size).to eq(1)
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
end