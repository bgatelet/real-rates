require 'rails_helper'

RSpec.describe Api::V1::UserTokensController, type: :controller do
  let(:user) { create(:user) }

  describe 'POST #create' do
    context 'when the credentials are correct' do
      before do
        post :create, params: { auth: { email: user.email, password: user.password } }, format: :json
      end

      it { expect(response).to have_http_status(201) }
    end

    context 'when credentials are incorrect' do
      before do
        post :create, params: { auth: { email: user.email, password: 'ObviouLyIncoRrect' } }, format: :json
      end

      it { expect(response).to have_http_status(404) }
    end
  end
end
