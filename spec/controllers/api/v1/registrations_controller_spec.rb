require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :controller do
  describe 'POST #create' do
    context 'when is successfully created' do
      before do
        post :create, params: attributes_for(:user), format: :json
      end

      it { expect(response).to have_http_status(200) }
    end

    context 'when is not created' do
      before do
        post :create, params: attributes_for(:user, :invalid), format: :json
      end

      it { expect(response).to have_http_status(422) }
    end
  end
end
