require 'rails_helper'

RSpec.describe Api::V1::ListsController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:list) { create(:list, user: :user) }
  before { sign_in(user) }

  describe "GET #create" do
    context 'when successfully created' do
      before do
        post :create, params: attributes_for(:list), format: :json
      end

      it { expect(response).to have_http_status(200) }
    end

    context 'when not created' do
      before do
        post :create, params: attributes_for(:list, :invalid), format: :json
      end

      it { expect(response).to have_http_status(422) }
    end
  end

  describe "GET #update" do
    context 'when successfully updated' do
      before do
        patch :update, params: { user_id: user.id }, format: :json
      end

      it { expect(response).to have_http_status(200) }
    end

    context 'when not updated' do
      before do
        patch :update, params: attributes_for(:list, :invalid), format: :json
      end

      it { expect(response).to have_http_status(422) }
    end
  end

  describe "GET #show" do
    context 'show current user list' do
      before do
        get :show, params: { id: list.id }, format: :json
      end

      it { expect(response).to have_http_status(200) }
    end

    context 'do not show other user list' do
      before do
        before { sign_in(other_user) }
        get :show, params: { id: list.id }, format: :json
      end

      it { expect(response).to have_http_status(422) }
    end
  end

end
