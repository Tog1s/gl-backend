class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  before_action :authenticate_user!
  before_action :set_current_user

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
end
