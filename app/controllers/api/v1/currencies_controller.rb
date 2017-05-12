class Api::V1::CurrenciesController < ApplicationController
  before_action :authenticate
  before_action :set_currency, only: [:update, :show]
  respond_to :json

  def create
    potential_currency = Currency.find_by(code: params[:code])

    if potential_currency != nil
      if current_user.list.currencies.exists?(potential_currency.id)
        @currency = potential_currency
      else
        ListCurrency.create!(list_id: current_user.list.id, currency_id: potential_currency.id)
      end
    else
      @currency = current_user.list.currencies.create!(currency_params)
    end
  end

  def update
    @currency.update!(update_params)
  end

  def show
  end

  private

  def currency_params
    params.permit(:code, :rate)
  end

  def update_params
    params.permit(:rate)
  end

  def set_currency
    @currency = Currency.find(params[:id])
  end
end
