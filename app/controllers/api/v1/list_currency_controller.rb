class Api::V1::ListCurrencyController < ApplicationController
  def destroy
    @list_currency = ListCurrency.find_by!(list_id: params[:list_id], currency_id: params[:currency_id])
    @list_currency.destroy!
  end
end
