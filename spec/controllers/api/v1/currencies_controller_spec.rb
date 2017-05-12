require 'rails_helper'

RSpec.describe Api::V1::CurrenciesController, type: :controller do
  let(:user) { create(:user) }
  let(:list) { create(:list, user: user) }
  let(:currency) { create(:currency, lists: [list]) }

  before { sign_in(user) }

  describe "POST #create" do
    context 'when successfully created' do
      before do
        post :create, params: attributes_for(:currency), format: :json
      end

      it { expect(response).to have_http_status(200) }
    end

    context 'when not created' do
      before do
        post :create, params: attributes_for(:currency, :invalid), format: :json
      end

      it { expect(response).to have_http_status(422) }
    end

    context 'currency is not created when one with the same code already exists' do
      before do
        post :create, params: { code: 'TEST' }, format: :json
        post :create, params: { code: 'TEST' }, format: :json
      end

      it {
        user.list.reload
        expect(user.list.currencies_count).to eq(1)
      }
    end
  end

  describe "GET #show" do
    before do
      get :show, params: { id: currency.id }, format: :json
    end

    it { expect(response).to have_http_status(200) }
  end

end
