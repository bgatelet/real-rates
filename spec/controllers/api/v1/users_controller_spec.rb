require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  before { sign_in(user) }

  describe "GET #create" do
    context 'when successfully created' do
      before do
        post :create, params: attributes_for(:user), format: :json
      end

      it { expect(response).to have_http_status(200) }
    end

    context 'when not created' do
      before do
        post :create, params: attributes_for(:user, :invalid), format: :json
      end

      it { expect(response).to have_http_status(422) }
    end
  end

  describe "GET #update" do
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
  end

  describe "GET #show" do
    context 'user fetched' do
      before do
        get :show, params: { id: user.id }, format: :json
      end

      it { expect(response).to have_http_status(200) }
    end

    context 'showing another user denied' do
      before do
        get :show, params: { id: other_user.id }, format: :json
      end

      it { expect(response).to have_http_status(422) }
    end
  end

end
