class Api::V1::RegistrationsController < ApplicationController
  respond_to :json

  def create
    @user = User.create!(user_params)
    List.create!(user_id: @user.id)
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
