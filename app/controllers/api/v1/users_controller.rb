class Api::V1::UsersController < ApplicationController
  before_action :authenticate
  before_action :set_user, only: [:update, :show]
  respond_to :json
  
  def update
    @user.update!(user_params)
  end

  def show
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def set_user
    @user = current_user
  end
end
