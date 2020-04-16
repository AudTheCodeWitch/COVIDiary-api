class Api::UsersController < ApplicationController
  def index
    users = User.all
    render json: UserSerializer.new(users)
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: UserSerializer.new(user)
    else
      render json: { error: "Error creating user" }
    end
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user)
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: UserSerializer.new(user)
    else
      render json: { error: "Error updating user" }
    end

  end

  def destroy
    user = User.find(params[:id])
    user.destroy
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
