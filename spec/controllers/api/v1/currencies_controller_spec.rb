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
      render_views

      before do
        post :create, params: { code: 'TEST', rate: 1.4 }, format: :json
        post :create, params: { code: 'TEST', rate: 1.2 }, format: :json
      end

      it { expect(response.body).to include("1.4") }
    end
  end

  describe "POST #update" do
    context 'when successfully updated' do
      before do
        patch :update, params: { id: currency.id, rate: 1.4 }, format: :json
      end

      it { expect(response).to have_http_status(200) }
    end

    context 'when not updated' do
      render_views

      before do
        patch :update, params: { id: currency.id, code: '' }, format: :json
      end

      it { expect(response.body).not_to include("code: ''") }
    end

    context 'code should not be updated' do
      render_views
      updated_code = FFaker::Currency.code

      before do
        patch :update, params: { id: currency.id, code: updated_code }, format: :json
      end

      it { expect(response.body).not_to include(updated_code) }
    end

    context 'rate must exist' do
      before do
        patch :update, params: { id: currency.id, rate: nil }, format: :json
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
