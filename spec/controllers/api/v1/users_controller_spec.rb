require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in(user) }

  describe "POST #update" do
    context 'when successfully updated' do
      before do
        patch :update, params: { password: FFaker::Internet.password }, format: :json
      end

      it { expect(response).to have_http_status(200) }
    end

    context 'when not updated' do
      before do
        patch :update, params: { password: '' }, format: :json
      end

      it { expect(response).to have_http_status(422) }
    end

    context 'email must exist' do
      before do
        patch :update, params: { email: '' }, format: :json
      end

      it { expect(response).to have_http_status(422) }
    end

    context 'successfully updates list\'s base currency' do
      before do
        patch :update, params: { list_attributes: { id: user.list.id, base_currency: "EUR" } }, format: :json
      end

      it {
        user.list.reload
        expect(user.list.base_currency).to eq("EUR")
      }
    end
  end

  describe "GET #show" do
    context 'user fetched' do
      before do
        get :show, format: :json
      end

      it { expect(response).to have_http_status(200) }
    end

    context 'user fetched is current user' do
      render_views

      before do
        get :show, format: :json
      end

      it { expect(response.body).to include(user.id) }
    end
  end

end
