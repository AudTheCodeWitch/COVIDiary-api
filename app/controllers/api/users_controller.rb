class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: { error: "Error creating user" }
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(
        :id,
        :first_name,
        :last_name,
        :email,
        :birth_date,
        :occupation,
        :essential?,
        :isolation_start,
        :isolation_end,
        :about
    )
  end
end
