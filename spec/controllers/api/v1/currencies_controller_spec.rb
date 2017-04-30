require 'rails_helper'

RSpec.describe Api::V1::CurrenciesController, type: :controller do
  let(:user) { create(:user) }
  let(:currency) { create(:currency) }
  before { sign_in(user) }

  describe "GET #index" do
    before do
      get :index, format: :json
    end

    it { expect(response).to have_http_status(200) }
  end

  describe "GET #create" do
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
  end

  describe "GET #update" do
    context 'when successfully updated' do
      before do
        patch :update, params: { rate: 1.4 }, format: :json
      end

      it { expect(response).to have_http_status(200) }
    end

    context 'when not updated' do
      before do
        patch :update, params: attributes_for(:currency, :invalid), format: :json
      end

      it { expect(response).to have_http_status(422) }
    end

    context 'code should not be updated' do
      before do
        patch :update, params: { code: FFaker::Currency.code }, format: :json
      end

      it { expect(response).to have_http_status(422) }
    end

    context 'code must exist' do
      before do
        patch :update, params: { currency: '' }, format: :json
      end

      it { expect(response).to have_http_status(422) }
    end

    context 'rate must exist' do
      before do
        patch :update, params: { rate: nil }, format: :json
      end

      it { expect(response).to have_http_status(422) }
    end
  end

  describe "GET #show" do
    before do
      get :show, params: { id: currency.id }, format: :json
    end

    it { expect(response).to have_http_status(200) }
  end

end
