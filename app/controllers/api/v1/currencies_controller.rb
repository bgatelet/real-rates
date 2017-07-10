class Api::V1::CurrenciesController < ApplicationController
  before_action :authenticate
  before_action :set_currency, only: [:update, :show]
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
        ListCurrency.create!(list_id: current_user.list.id, currency_id: potential_currency.id)
      end
    # Create the new currency if it doesn't already exist.
    else
      @currency = current_user.list.currencies.create!(currency_params)
    end
  end

  def show
  end

  private

  def currency_params
    params.permit(:code)
  end

  def set_currency
    @currency = Currency.find(params[:id])
  end
end
