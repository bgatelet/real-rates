class Api::V1::CurrenciesController < ApplicationController
  before_action :authenticate
  respond_to :json

  def create
    potential_currency = Currency.find_by(code: params[:code])

    # Check if the currency already exists.
    if potential_currency != nil
      # If it does, check if the user's list contains it.
      if current_user.list.currencies.exists?(potential_currency.id)
        @currency = potential_currency
      # Else create a link between the user's list and existing currency.
      else
        list_currency = ListCurrency.create!(list_id: current_user.list.id, currency_id: potential_currency.id)
        @currency = list_currency.currency
      end
    # Create the new currency if it doesn't already exist.
    else
      @currency = current_user.list.currencies.create!(currency_params)
    end
  end

  def show
    @currency = Currency.find(params[:id])
  end

  private

  def currency_params
    params.permit(:code)
  end
end
