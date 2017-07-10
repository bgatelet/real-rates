class Api::V1::ListCurrencyController < ApplicationController
  def destroy
    currency = Currency.find_by!(code: params[:code])
    @list_currency = ListCurrency.find_by!(list_id: params[:list_id], currency_id: currency.id)
    @list_currency.destroy!
  end
end
