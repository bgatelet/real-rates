require 'rails_helper'

RSpec.describe Api::V1::ListCurrencyController, type: :controller do
  let(:user) { create(:user) }
  let(:list) { create(:list, user: user) }
  let(:currency) { create(:currency, lists: [list]) }
  before { sign_in(user) }

  describe "GET #destroy" do
    before do
      delete :destroy, params: { list_id: list.id, currency_id: currency.id }, format: :json
    end

    it { expect(response).to have_http_status(204) }
  end

end
